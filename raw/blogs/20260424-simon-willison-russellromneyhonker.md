---
source_url: https://simonwillison.net/2026/Apr/24/honker/#atom-everything
fetched: 2026-04-24T12:00:00Z
fetcher: blogwatcher
content_type: blog
author: Simon Willison
published_date: 2026-04-24
slug: russellromneyhonker
---

[Simon Willison’s Weblog](https://simonwillison.net/)

======================================================

[Subscribe](https://simonwillison.net/about/#subscribe)

**Sponsored by:** Sonar — Now with SAST + SCA for secure, dependency-aware Agentic Engineering. [SonarQube Advanced Security](https://fandf.co/4bzyODl)

24th April 2026 - Link Blog

**[russellromney/honker](https://github.com/russellromney/honker)
** ([via](https://news.ycombinator.com/item?id=47874647 "Show HN")
) "Postgres NOTIFY/LISTEN semantics" for SQLite, implemented as a Rust SQLite extension and various language bindings to help make use of it.

The design of this looks very solid. It lets you write Python code for queues that looks like this:

import honker

db \= honker.open("app.db")
emails \= db.queue("emails")
emails.enqueue({"to": "alice@example.com"})

\# Consume (in a worker process)
async for job in emails.claim("worker-1"):
    send(job.payload)
    job.ack()

And Kafka-style durable streams like this:

stream \= db.stream("user-events")

with db.transaction() as tx:
    tx.execute("UPDATE users SET name=? WHERE id=?", \[name, uid\])
    stream.publish({"user\_id": uid, "change": "name"}, tx\=tx)

async for event in stream.subscribe(consumer\="dashboard"):
    await push\_to\_browser(event)

It also adds 20+ custom SQL functions including these two:

```sql
SELECT notify('orders', '{"id":42}');
SELECT honker_stream_read_since('orders', 0, 1000);
```

The extension requires WAL mode, and workers can poll the `.db-wal` file with a stat call every 1ms to get as close to real-time as possible without the expense of running a full SQL query.

honker implements the **transactional outbox pattern**, which ensures items are only queued if a transaction successfully commits. My favorite explanation of that pattern remains [Transactionally Staged Job Drains in Postgres](https://brandur.org/job-drain)
 by Brandur Leach. It's great to see a new implementation of that pattern for SQLite.

Posted [24th April 2026](https://simonwillison.net/2026/Apr/24/)
 at 1:50 am

Recent articles
---------------

*   [DeepSeek V4 - almost on the frontier, a fraction of the price](https://simonwillison.net/2026/Apr/24/deepseek-v4/)
     - 24th April 2026
*   [Extract PDF text in your browser with LiteParse for the web](https://simonwillison.net/2026/Apr/23/liteparse-for-the-web/)
     - 23rd April 2026
*   [A pelican for GPT-5.5 via the semi-official Codex backdoor API](https://simonwillison.net/2026/Apr/23/gpt-5-5/)
     - 23rd April 2026

This is a **link post** by Simon Willison, posted on [24th April 2026](https://simonwillison.net/2026/Apr/24/)
.

[databases 112](https://simonwillison.net/tags/databases/)
 [postgresql 159](https://simonwillison.net/tags/postgresql/)
 [sqlite 461](https://simonwillison.net/tags/sqlite/)
 [rust 107](https://simonwillison.net/tags/rust/)

### Monthly briefing

Sponsor me for **$10/month** and get a curated email digest of the month's most important LLM developments.

Pay me to send you less!

[Sponsor & subscribe](https://github.com/sponsors/simonw/)

*   [Disclosures](https://simonwillison.net/about/#disclosures)
    
*   [Colophon](https://simonwillison.net/about/#about-site)
    
*   ©
*   [2002](https://simonwillison.net/2002/)
    
*   [2003](https://simonwillison.net/2003/)
    
*   [2004](https://simonwillison.net/2004/)
    
*   [2005](https://simonwillison.net/2005/)
    
*   [2006](https://simonwillison.net/2006/)
    
*   [2007](https://simonwillison.net/2007/)
    
*   [2008](https://simonwillison.net/2008/)
    
*   [2009](https://simonwillison.net/2009/)
    
*   [2010](https://simonwillison.net/2010/)
    
*   [2011](https://simonwillison.net/2011/)
    
*   [2012](https://simonwillison.net/2012/)
    
*   [2013](https://simonwillison.net/2013/)
    
*   [2014](https://simonwillison.net/2014/)
    
*   [2015](https://simonwillison.net/2015/)
    
*   [2016](https://simonwillison.net/2016/)
    
*   [2017](https://simonwillison.net/2017/)
    
*   [2018](https://simonwillison.net/2018/)
    
*   [2019](https://simonwillison.net/2019/)
    
*   [2020](https://simonwillison.net/2020/)
    
*   [2021](https://simonwillison.net/2021/)
    
*   [2022](https://simonwillison.net/2022/)
    
*   [2023](https://simonwillison.net/2023/)
    
*   [2024](https://simonwillison.net/2024/)
    
*   [2025](https://simonwillison.net/2025/)
    
*   [2026](https://simonwillison.net/2026/)