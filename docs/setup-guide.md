# Setup Guide

## Prerequisites

- Git 2.x or higher
- A GitHub account with a verified email
- Bash shell (for running scripts)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/neelashish/github-green-test.git
   cd github-green-test
   ```

2. Verify your git configuration:
   ```bash
   git config user.name
   git config user.email
   ```

3. Make sure the email matches your GitHub account email.

## Configuration

Set your git identity for this repository:

```bash
git config user.name "Your Name"
git config user.email "your-email@example.com"
```

## Verifying Setup

Run the validation script to check everything is configured correctly:

```bash
bash scripts/validate_commits.sh
```

## Running Tests

The project includes several test scripts:

```bash
# Run individual tests
bash tests/test_dates.sh
bash tests/test_email.sh
bash tests/test_setup.sh
bash tests/test_hooks.sh
bash tests/test_validate.sh
bash tests/test_export.sh

# Run all tests
for t in tests/test_*.sh; do
    echo "--- $t ---"
    bash "$t"
    echo ""
done
```

## Using the Analysis Tools

```bash
# Analyze commit patterns
git log --pretty=format:"%ad|%ae|%s" --date=short | python3 examples/commit_analyzer.py

# Generate weekly report
python3 examples/weekly_report.py

# View contribution calendar
python3 examples/contribution_calendar.py
```
