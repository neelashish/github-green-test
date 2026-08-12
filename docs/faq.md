# Frequently Asked Questions

## Why aren't my commits showing on my GitHub profile?

The most common reasons are:

1. **Wrong email**: The commit author email doesn't match any email on your GitHub
   account. Check with `git config user.email` and compare to your
   [GitHub email settings](https://github.com/settings/emails).

2. **Wrong branch**: Commits must be on the default branch (usually `main` or
   `master`) to count as contributions.

3. **Fork commits**: Commits in forked repositories only count if merged into the
   upstream repository.

## Can I backfill my contribution graph?

Yes, you can create commits with past dates using:

```bash
GIT_AUTHOR_DATE="2026-01-15T12:00:00" git commit -m "message"
```

GitHub uses the author date for the contribution graph placement.

## What time zone does GitHub use?

GitHub uses UTC for the contribution graph. A commit at 11:30 PM EST on Monday
would appear as Tuesday on the graph (since that's 4:30 AM UTC Tuesday).

## Is there a limit to how far back I can backfill?

GitHub shows the last 365 days on the contribution graph by default. Older
contributions still exist but won't appear on the main profile view.
