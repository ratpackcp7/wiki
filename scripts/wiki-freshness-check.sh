#!/bin/bash
# wiki-freshness-check.sh — Verify wiki matches reality and report stale pages
# Runs via cron, reports to Telegram

set -euo pipefail

WIKI=~/wiki
REPORT_FILE=$(mktemp)
TODAY=$(date +%Y-%m-%d)
STALE_FOUND=0

echo "Wiki Freshness Check — $TODAY" > "$REPORT_FILE"
echo "================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# === FUNCTION: Check frontmatter last_verified ===
check_stale_pages() {
    local dir="$1"
    local max_age_days="$2"
    local dir_name=$(basename "$dir")
    
    echo "## Checking $dir_name/ (max age: ${max_age_days} days)" >> "$REPORT_FILE"
    
    for f in "$WIKI/$dir"/*.md; do
        [ -f "$f" ] || continue
        local fname=$(basename "$f")
        
        # Extract last_verified from frontmatter
        local last_verified=$(sed -n '/^---$/,/^---$/p' "$f" | grep '^last_verified:' | head -1 | awk '{print $2}')
        
        if [ -z "$last_verified" ]; then
            echo "  ⚠️  $fname: NO last_verified" >> "$REPORT_FILE"
            STALE_FOUND=1
            continue
        fi
        
        # Calculate days since last_verified
        local last_epoch=$(date -d "$last_verified" +%s 2>/dev/null || echo 0)
        local today_epoch=$(date -d "$TODAY" +%s)
        local days_old=$(( (today_epoch - last_epoch) / 86400 ))
        
        if [ "$days_old" -gt "$max_age_days" ]; then
            echo "  ❌ $fname: stale ($days_old days old, last_verified: $last_verified)" >> "$REPORT_FILE"
            STALE_FOUND=1
        else
            echo "  ✅ $fname: fresh ($days_old days old)" >> "$REPORT_FILE"
        fi
    done
    echo "" >> "$REPORT_FILE"
}

# === FUNCTION: Verify docker containers match wiki claims ===
check_docker_state() {
    echo "## Docker State vs Wiki Claims" >> "$REPORT_FILE"
    
    # Get running containers
    local running=$(docker ps --format '{{.Names}} {{.Ports}}' 2>/dev/null || echo "")
    
    # Check entities/acerserver.md claims
    local wiki_file="$WIKI/entities/acerserver.md"
    if [ -f "$wiki_file" ]; then
        # Extract port claims from wiki (simple grep for port patterns)
        local claimed_ports=$(grep -oP ':\d+' "$wiki_file" | sort -u || echo "")
        
        for port in $claimed_ports; do
            port_num=${port:1}  # Remove leading :
            if ss -tlnp | grep -q ":$port_num "; then
                echo "  ✅ Port $port_num: listening (claimed in wiki)" >> "$REPORT_FILE"
            else
                echo "  ⚠️  Port $port_num: NOT listening (but claimed in wiki)" >> "$REPORT_FILE"
                STALE_FOUND=1
            fi
        done
    fi
    echo "" >> "$REPORT_FILE"
}

# === FUNCTION: Check git repos for new commits ===
check_git_freshness() {
    echo "## Git Repo Freshness" >> "$REPORT_FILE"
    
    for repo_dir in ~/projects/*/; do
        [ -d "$repo_dir/.git" ] || continue
        local repo_name=$(basename "$repo_dir")
        
        # Get latest commit date
        local latest_commit=$(cd "$repo_dir" && git log -1 --format=%ci 2>/dev/null || echo "unknown")
        local commit_date=$(echo "$latest_commit" | cut -d' ' -f1)
        
        # Check if projects/ page exists and is recent
        local project_page="$WIKI/projects/$repo_name.md"
        if [ -f "$project_page" ]; then
            local page_date=$(sed -n '/^---$/,/^---$/p' "$project_page" | grep '^updated:' | head -1 | awk '{print $2}')
            if [ "$page_date" < "$commit_date" ]; then
                echo "  ⚠️  $repo_name: wiki page outdated (commit: $commit_date, page: $page_date)" >> "$REPORT_FILE"
                STALE_FOUND=1
            else
                echo "  ✅ $repo_name: wiki page current" >> "$REPORT_FILE"
            fi
        else
            echo "  ⚠️  $repo_name: NO wiki page in projects/" >> "$REPORT_FILE"
            STALE_FOUND=1
        fi
    done
    echo "" >> "$REPORT_FILE"
}

# === Run all checks ===
check_stale_pages "entities" 90
check_stale_pages "concepts" 90
check_stale_pages "projects" 30
check_docker_state
check_git_freshness

# === Engineering directories (from engineering/AGENTS.md churn rates) ===
echo "## Engineering Pages (from engineering/AGENTS.md)" >> "$REPORT_FILE"
for dir in principles languages practices; do
    [ -d "$WIKI/engineering/$dir" ] && check_stale_pages "engineering/$dir" 90
done
[ -d "$WIKI/engineering/stacks" ] && check_stale_pages "engineering/stacks" 30
echo "" >> "$REPORT_FILE"

# === Summary ===
echo "================================" >> "$REPORT_FILE"
if [ "$STALE_FOUND" -eq 0 ]; then
    echo "✅ All wiki pages are fresh and match reality." >> "$REPORT_FILE"
else
    echo "⚠️  Stale pages or mismatches detected — see details above." >> "$REPORT_FILE"
fi

# === Output ===
cat "$REPORT_FILE"

# Send to Telegram if not running interactively
if [ ! -t 0 ]; then
    # This script runs in cron, send via hermit or curl to Telegram bot
    # Bob will pick this up via the cron job's deliver setting
    :
fi

rm -f "$REPORT_FILE"
