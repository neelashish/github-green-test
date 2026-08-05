# GitHub Green Test

A repository for testing and understanding GitHub's contribution graph mechanics.

## Overview

This project explores how GitHub tracks and displays contributions on user profiles.
It serves as both a learning tool and a reference for anyone curious about how the
green contribution squares work.

## Quick Start

`ash
git clone https://github.com/neelashish/github-green-test.git
cd github-green-test
`

## Usage

### Creating a backdated commit

```bash
# Set the date for the commit
export GIT_AUTHOR_DATE="2026-08-01T12:00:00 +0000"
export GIT_COMMITTER_DATE="2026-08-01T12:00:00 +0000"

git commit -m "Your message"
```

See the [examples](examples/) directory for ready-to-use scripts.

## Project Structure

```
github-green-test/
+-- README.md
+-- docs/           # Documentation and guides
+-- examples/       # Example scripts
+-- activity.txt    # Activity log
+-- green-test.sh   # Original test script
```

## Status

Under active development.

