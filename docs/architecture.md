# Project Architecture

## Directory Structure

```
github-green-test/
+-- README.md              # Project overview and quick start
+-- CONTRIBUTING.md        # Contribution guidelines
+-- CHANGELOG.md           # Version history
+-- LICENSE                # MIT License
+-- .gitignore             # Git ignore rules
|
+-- activity.txt           # Activity log (commit tracking)
+-- green-test.sh          # Original contribution test script
+-- timestamp-test.txt     # Timestamp test file
|
+-- docs/                  # Documentation
|   +-- github-contributions.md  # How contributions work
|   +-- setup-guide.md          # Setup instructions
|   +-- faq.md                  # Frequently asked questions
|   +-- troubleshooting.md      # Problem-solving guide
|   +-- best-practices.md       # Git best practices
|   +-- architecture.md         # This file
|
+-- examples/              # Example scripts
|   +-- basic_commit.sh         # Single commit example
|   +-- date_range.sh           # Multi-date commit example
|   +-- natural_distribution.py # Commit schedule generator
|   +-- commit_analyzer.py      # Repository analysis tool
|
+-- scripts/               # Utility scripts
|   +-- validate_commits.sh     # Commit validation
|   +-- check_email.sh          # Email configuration check
|   +-- setup.sh                # Repository setup
|
+-- tests/                 # Test scripts
    +-- test_dates.sh           # Date format tests
    +-- test_email.sh           # Email configuration tests
    +-- test_setup.sh           # Setup validation tests
```

## Design Decisions

### Why shell scripts?
Shell scripts provide the most direct interface with git and require
no additional dependencies beyond git itself.

### Why Python for analysis tools?
Python's standard library includes everything needed for date manipulation
and data analysis, making it ideal for commit pattern tools.

### Why activity.txt?
A simple text file that tracks commit activity provides a low-friction
way to generate meaningful file changes for each commit.

## File Categories

### Documentation (docs/)
Human-readable guides and references. Written in Markdown for GitHub
rendering compatibility.

### Examples (examples/)
Runnable scripts that demonstrate specific features. Shell scripts for
git operations, Python for data analysis and reporting.

### Scripts (scripts/)
Utility scripts for repository maintenance and validation. These are
tools for the repository maintainer, not examples.

### Tests (tests/)
Validation scripts that verify the repository is correctly configured.
Each test script follows a consistent pattern with pass/fail assertions.
A simple text file that tracks commit activity provides a low-friction
way to generate meaningful file changes for each commit.

