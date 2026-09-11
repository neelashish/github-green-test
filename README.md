# GitHub Green Test

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A repository for testing and understanding GitHub's contribution graph mechanics.

## Table of Contents

- [Overview](#overview)
- [Quick Start](#quick-start)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Documentation](#documentation)
- [Status](#status)

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

## Documentation

- [How GitHub Contributions Work](docs/github-contributions.md)
- [Setup Guide](docs/setup-guide.md)

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for
guidelines on how to submit changes.

## Status

Under active development. See [CHANGELOG](CHANGELOG.md) for recent updates.





