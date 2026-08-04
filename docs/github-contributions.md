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
