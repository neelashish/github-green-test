# Git Best Practices

## Commit Messages

Follow the conventional commits specification:

```
<type>: <description>

[optional body]
```

Common types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `refactor`: Code restructuring without behavior change
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

## Email Consistency

Always ensure your git email matches your GitHub account:

```bash
# Check current setting
git config user.email

# Set for current repo only
git config user.email "you@example.com"

# Set globally
git config --global user.email "you@example.com"
```

## Branching

- Use `main` as the default branch
- Create feature branches for new work
- Merge (don't rebase shared branches) to preserve history

## Small, Focused Commits

Each commit should represent one logical change. This makes the history
easier to read and debug with tools like `git bisect`.
