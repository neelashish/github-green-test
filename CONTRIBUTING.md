# Contributing to GitHub Green Test

Thank you for your interest in contributing!

## How to Contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-change`)
3. Make your changes
4. Run the tests (`bash tests/test_dates.sh`)
5. Commit with a descriptive message
6. Push to your fork
7. Open a Pull Request

## Code Style

- Shell scripts should use `set -euo pipefail`
- Python scripts should follow PEP 8
- Use meaningful variable names
- Add comments for non-obvious logic

## Commit Messages

Follow [conventional commits](https://www.conventionalcommits.org/):

```
docs: update FAQ with timezone info
feat: add commit statistics script
fix: correct date parsing in date_range.sh
```

## Testing

Before submitting a PR, run the test suite:

```bash
# Run all tests
for test in tests/test_*.sh; do
    echo "Running $test..."
    bash "$test"
    echo ""
done
```

Each test script exits with code 0 on success and non-zero on failure.

## Documentation

If you add a new script or feature, please:
1. Add a comment header explaining usage
2. Update the relevant docs in `docs/`
3. Update `CHANGELOG.md`
4. Update the architecture doc if adding new files

## Reporting Issues

If you find a bug or have a suggestion, please open an issue on GitHub
with a clear description and steps to reproduce (if applicable).

