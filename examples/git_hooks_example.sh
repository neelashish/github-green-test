#!/bin/bash
# git_hooks_example.sh - Example pre-commit hook for email validation
#
# This script can be installed as a git pre-commit hook to ensure
# that the configured email matches expected patterns.
#
# Installation:
#   cp examples/git_hooks_example.sh .git/hooks/pre-commit
#   chmod +x .git/hooks/pre-commit

set -euo pipefail

EMAIL=$(git config user.email)

# Check that email is set
if [ -z "$EMAIL" ]; then
    echo "ERROR: No git email configured."
    echo "Run: git config user.email 'your-email@example.com'"
    exit 1
fi

# Check for common email domains
case "$EMAIL" in
    *@gmail.com|*@outlook.com|*@yahoo.com|*@users.noreply.github.com)
        # Known good domains
        ;;
    *)
        echo "WARNING: Using email '$EMAIL' - make sure this is linked to your GitHub account."
        ;;
esac

# Check that email doesn't look like a placeholder
case "$EMAIL" in
    *example.com*|*test*|*placeholder*)
        echo "ERROR: Email '$EMAIL' looks like a placeholder. Please set a real email."
        exit 1
        ;;
esac

echo "Pre-commit check passed (email: $EMAIL)"
