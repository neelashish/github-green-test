# How GitHub Contributions Work

## What Counts as a Contribution?

GitHub counts the following activities as contributions on your profile:

1. **Commits** - Must meet ALL of these criteria:
   - The email used for the commit is associated with your GitHub account
   - The commit was made on the default branch (or `gh-pages`)
   - The commit is not in a fork (unless merged upstream)

2. **Pull Requests** - Opening a PR in a non-fork repository

3. **Issues** - Opening an issue in a non-fork repository

## Common Pitfalls

- Using an email not linked to your GitHub account
- Committing to a non-default branch without merging
- Working in a forked repository without upstream merges

## Verifying Your Email

Check your email settings at: https://github.com/settings/emails

Make sure the email in your git config matches one listed there:

`ash
git config user.email
`

## Timestamps

GitHub uses the **author date** (not the committer date) to determine which day
a commit falls on in the contribution graph. Both dates are typically the same,
but they can differ when commits are rebased or cherry-picked.

## Advanced: Author Date vs Committer Date

Git stores two dates for every commit:

- **Author Date**: When the change was originally written
- **Committer Date**: When the commit was applied (e.g., after a rebase)

GitHub uses the **author date** for the contribution graph. You can set
both independently:

```bash
GIT_AUTHOR_DATE="2026-08-01T10:00:00 +0530" \
GIT_COMMITTER_DATE="2026-08-01T10:00:00 +0530" \
git commit -m "Commit with specific date"
```

To see both dates for existing commits:

```bash
git log --pretty=fuller
```

## Timezone Considerations

GitHub normalizes all dates to UTC for the contribution graph. If you are
in IST (UTC+5:30), keep this in mind:

| Local Time (IST)   | UTC Time          | Graph Day |
|---------------------|-------------------|-----------|
| Mon 01:00 AM        | Sun 07:30 PM      | Sunday    |
| Mon 06:00 AM        | Mon 00:30 AM      | Monday    |
| Mon 11:30 PM        | Mon 06:00 PM      | Monday    |
