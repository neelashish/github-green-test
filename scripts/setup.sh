#!/bin/bash
# setup.sh - One-time setup for the repository
#
# Configures git identity and verifies the setup is correct.
# Run this after cloning the repository.

set -euo pipefail

echo "=== GitHub Green Test - Setup ==="
echo ""

# Check if git is available
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed"
    exit 1
fi

# Check git version
GIT_VERSION=$(git --version)
echo "Git version: $GIT_VERSION"
echo ""

# Prompt for configuration if not set
CURRENT_EMAIL=$(git config user.email 2>/dev/null || true)
CURRENT_NAME=$(git config user.name 2>/dev/null || true)

if [ -z "$CURRENT_EMAIL" ]; then
    echo "No email configured for this repository."
    read -p "Enter your GitHub email: " EMAIL
    git config user.email "$EMAIL"
    echo "Email set to: $EMAIL"
else
    echo "Current email: $CURRENT_EMAIL"
fi

if [ -z "$CURRENT_NAME" ]; then
    echo "No name configured for this repository."
    read -p "Enter your name: " NAME
    git config user.name "$NAME"
    echo "Name set to: $NAME"
else
    echo "Current name: $CURRENT_NAME"
fi

echo ""
echo "Setup complete. Run 'bash scripts/validate_commits.sh' to verify."
