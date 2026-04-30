#!/usr/bin/env bash
# One-shot: add all feeds from feeds.tsv to blogwatcher-cli
set -euo pipefail
export BLOGWATCHER_DB="${BLOGWATCHER_DB:-$HOME/wiki/raw/blogs/blogwatcher-cli.db}"
BW="$HOME/.local/bin/blogwatcher-cli"
TSV="$HOME/wiki/raw/blogs/feeds.tsv"

added=0
skipped=0
failed=0

while IFS=$'\t' read -r tier name url feed_url; do
  [[ "$tier" =~ ^# ]] && continue
  [[ -z "$tier" ]] && continue

  if "$BW" blogs 2>/dev/null | grep -qF "  $name"; then
    echo "SKIP  $name (already present)"
    skipped=$((skipped+1))
    continue
  fi

  if "$BW" add "$name" "$url" --feed-url "$feed_url" 2>&1 | tail -3; then
    echo "ADDED $name"
    added=$((added+1))
  else
    echo "FAIL  $name"
    failed=$((failed+1))
  fi
done < "$TSV"

echo
echo "Summary: added=$added skipped=$skipped failed=$failed"
