#!/usr/bin/env bash
#
# validate-constitution.sh — Integrity check for your AI constitution
#
# Checks:
#   1. CONSTITUTION.md exists and hasn't been modified since last approved commit
#   2. decisions/ folder exists and has entries
#   3. Basic structural validation
#
# Usage:
#   ./scripts/validate-constitution.sh
#   # Or as a pre-commit hook:
#   ln -s ../../scripts/validate-constitution.sh .git/hooks/pre-commit

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CONSTITUTION="$REPO_ROOT/CONSTITUTION.md"
DECISIONS_DIR="$REPO_ROOT/decisions"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASS=0
WARN=0
FAIL=0

check_pass()  { echo -e "  ${GREEN}✓${NC} $1"; PASS=$((PASS+1)); }
check_warn()  { echo -e "  ${YELLOW}⚠${NC} $1"; WARN=$((WARN+1)); }
check_fail()  { echo -e "  ${RED}✗${NC} $1"; FAIL=$((FAIL+1)); }

echo ""
echo "═══════════════════════════════════════════"
echo "  Constitution Integrity Report"
echo "  $(date '+%Y-%m-%d %H:%M:%S')"
echo "═══════════════════════════════════════════"
echo ""

# --- Check 1: Constitution exists ---
echo "📄 Constitution File"
if [[ -f "$CONSTITUTION" ]]; then
    check_pass "CONSTITUTION.md exists"
    
    # Check for key structural sections
    for section in "Foundations" "Principles" "Autonomy" "Amendment"; do
        if grep -qi "$section" "$CONSTITUTION"; then
            check_pass "Contains '$section' section"
        else
            check_warn "Missing '$section' section — consider adding it"
        fi
    done
    
    # Word count
    WORDS=$(wc -w < "$CONSTITUTION" | tr -d ' ')
    if (( WORDS < 100 )); then
        check_warn "Constitution is only $WORDS words — seems thin"
    else
        check_pass "Constitution is $WORDS words"
    fi
else
    check_fail "CONSTITUTION.md not found!"
fi

echo ""

# --- Check 2: Git integrity ---
echo "🔒 Git Integrity"
if git -C "$REPO_ROOT" rev-parse --git-dir &>/dev/null; then
    check_pass "Repository is under git version control"
    
    # Check if constitution has uncommitted changes
    if git -C "$REPO_ROOT" diff --quiet -- CONSTITUTION.md 2>/dev/null; then
        if git -C "$REPO_ROOT" diff --cached --quiet -- CONSTITUTION.md 2>/dev/null; then
            check_pass "No uncommitted changes to CONSTITUTION.md"
        else
            check_warn "CONSTITUTION.md has staged but uncommitted changes"
        fi
    else
        check_fail "CONSTITUTION.md has been modified since last commit!"
        echo -e "       Run: ${YELLOW}git diff CONSTITUTION.md${NC} to review changes"
    fi
    
    # Last commit info
    LAST_COMMIT=$(git -C "$REPO_ROOT" log -1 --format="%h %s (%ar)" -- CONSTITUTION.md 2>/dev/null || echo "none")
    echo -e "  ℹ  Last constitutional commit: $LAST_COMMIT"
else
    check_warn "Not a git repository — cannot verify integrity"
fi

echo ""

# --- Check 3: Decisions folder ---
echo "📋 Decision Log"
if [[ -d "$DECISIONS_DIR" ]]; then
    check_pass "decisions/ directory exists"
    
    ENTRY_COUNT=$(find "$DECISIONS_DIR" -name "*.md" -type f | wc -l | tr -d ' ')
    if (( ENTRY_COUNT == 0 )); then
        check_warn "No decision log entries found — start logging!"
    elif (( ENTRY_COUNT < 3 )); then
        check_pass "$ENTRY_COUNT decision(s) logged (still early — keep going)"
    else
        check_pass "$ENTRY_COUNT decisions logged"
    fi
    
    # Check for recent entries (last 30 days)
    RECENT=$(find "$DECISIONS_DIR" -name "*.md" -type f -mtime -30 | wc -l | tr -d ' ')
    if (( RECENT == 0 && ENTRY_COUNT > 0 )); then
        check_warn "No decisions logged in the last 30 days"
    elif (( RECENT > 0 )); then
        check_pass "$RECENT decision(s) in the last 30 days"
    fi
else
    check_fail "decisions/ directory not found — create it!"
fi

echo ""

# --- Summary ---
echo "═══════════════════════════════════════════"
TOTAL=$((PASS + WARN + FAIL))
echo -e "  Results: ${GREEN}$PASS passed${NC}  ${YELLOW}$WARN warnings${NC}  ${RED}$FAIL failed${NC}"

if (( FAIL > 0 )); then
    echo -e "  Status: ${RED}INTEGRITY CHECK FAILED${NC}"
    echo "═══════════════════════════════════════════"
    exit 1
elif (( WARN > 0 )); then
    echo -e "  Status: ${YELLOW}PASSED WITH WARNINGS${NC}"
    echo "═══════════════════════════════════════════"
    exit 0
else
    echo -e "  Status: ${GREEN}ALL CLEAR${NC}"
    echo "═══════════════════════════════════════════"
    exit 0
fi
