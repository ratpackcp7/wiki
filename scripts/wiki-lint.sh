#!/bin/bash
# wiki-lint.sh — Monthly lint pass for ~/wiki
# Checks: orphans, stale pages, missing cross-refs
# Runs via cron, reports to Telegram

WIKI_DIR="$HOME/wiki"
LOG_FILE="$HOME/.hermes/logs/wiki-lint.log"
DATE=$(date +%Y-%m-%d)

echo "=== Wiki Lint Pass: $DATE ===" > "$LOG_FILE"

cd "$WIKI_DIR" || exit 1

# Count files
TOTAL=$(find . -type f -name "*.md" -not -path "./.git/*" | wc -l)
echo "Total markdown files: $TOTAL" >> "$LOG_FILE"

# Find orphans (pages with no inbound wikilinks)
echo -e "\n=== Orphan Check ===" >> "$LOG_FILE"
python3 -c "
import os, re
from collections import defaultdict

files = []
for root, dirs, filenames in os.walk('.'):
    if '.git' in root:
        continue
    for f in filenames:
        if f.endswith('.md'):
            files.append(os.path.join(root, f))

inbound = defaultdict(list)
for f in files:
    try:
        with open(f) as fh:
            content = fh.read()
        links = re.findall(r'\[\[([^\]]+)\]\]', content)
        for link in links:
            inbound[link.strip()].append(f)
    except:
        pass

orphans = []
for f in files:
    if any(x in f for x in ['AGENTS.md', 'SCHEMA.md', 'index.md', 'BOB_INDEX.md', 'log.md']):
        continue
    fname = os.path.basename(f).replace('.md', '')
    found = False
    for link, sources in inbound.items():
        if fname in link or f in ' '.join(sources):
            found = True
            break
    if not found:
        orphans.append(f)

print(f'Orphan pages (no inbound links): {len(orphans)}')
for o in sorted(orphans)[:10]:
    print(f'  {o}')
" >> "$LOG_FILE" 2>&1

# Check stale last_verified
echo -e "\n=== Stale Pages Check (>90 days) ===" >> "$LOG_FILE"
python3 -c "
import re, os
from datetime import datetime

stale = []
for root, dirs, filenames in os.walk('.'):
    if '.git' in root:
        continue
    for f in filenames:
        if not f.endswith('.md'):
            continue
        filepath = os.path.join(root, f)
        try:
            with open(filepath) as fh:
                content = fh.read()
            if 'last_verified:' in content:
                match = re.search(r'last_verified:\s*(\d{4}-\d{2}-\d{2})', content)
                if match:
                    date_str = match.group(1)
                    try:
                        verified_date = datetime.strptime(date_str, '%Y-%m-%d')
                        days_old = (datetime.now() - verified_date).days
                        if days_old > 90:
                            stale.append((filepath, date_str, days_old))
                    except:
                        pass
        except:
            pass

print(f'Stale pages (>90 days): {len(stale)}')
for page, date, days in sorted(stale, key=lambda x: x[2], reverse=True)[:5]:
    print(f'  {page} (verified {date}, {days} days old)')
" >> "$LOG_FILE" 2>&1

# Size check
echo -e "\n=== Size Check ===" >> "$LOG_FILE"
du -sh . >> "$LOG_FILE"

echo -e "\n=== Lint Complete ===" >> "$LOG_FILE"

# Send to Telegram via Bob
cat "$LOG_FILE"
