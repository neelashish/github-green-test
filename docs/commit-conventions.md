# Commit Message Conventions

This project follows a simplified version of
[Conventional Commits](https://www.conventionalcommits.org/).

## Format

```
<type>: <short description>

[optional longer description]
```

## Types

| Type       | When to Use                                  |
|------------|----------------------------------------------|
| `feat`   | New feature or functionality                 |
| `fix`    | Bug fix                                      |
| `docs`   | Documentation only changes                   |
| `test`   | Adding or updating tests                     |
| `refactor`| Code change that neither fixes nor adds     |
| `chore`  | Build process, dependencies, tooling         |
| `scripts`| Changes to utility scripts                   |
| `examples`| Changes to example files                    |

## Examples

```
docs: add FAQ section about private repos
feat: add commit pattern analyzer script
fix: correct timezone handling in date_range.sh
test: add email validation tests
chore: update .gitignore with IDE patterns
refactor: improve green-test.sh error handling
```

## Tips

- Keep the first line under 72 characters
- Use imperative mood ("add" not "added")
- Don't end with a period
- Reference issues when applicable: `fix: resolve #42`
