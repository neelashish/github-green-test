# Troubleshooting Guide

## Problem: Commits not appearing on contribution graph

### Step 1: Check the author email
```bash
git log --pretty=format:"%ae" -5
```
Compare the output with your GitHub email settings.

### Step 2: Verify the branch
Commits must be on the default branch. Check which branch you're on:
```bash
git branch --show-current
```

### Step 3: Check if the repo is a fork
Forked repository commits don't count unless merged upstream.
Look for the "forked from" label on the repository page.

### Step 4: Wait for GitHub to update
GitHub's contribution graph can take up to 24 hours to update after
pushing new commits.

## Problem: Wrong date on contribution graph

GitHub uses the **author date** in UTC. If you're in a timezone ahead
of UTC (e.g., IST = UTC+5:30), a late-night commit might appear on the
next day in the contribution graph.

### Fix: Specify UTC times explicitly
```bash
GIT_AUTHOR_DATE="2026-08-01T12:00:00 +0000" git commit -m "message"
```

## Problem: Email typo in past commits

If past commits used a misspelled email, you have two options:
1. Add the typo email to your GitHub account (easiest)
2. Rewrite history with `git filter-repo` (destructive)
