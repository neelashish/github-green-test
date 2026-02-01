# Bash Safety Options

Always start scripts with safety options: set -e (exit on error), -u (error on undefined variables), -o pipefail (catch errors in pipes). These three flags prevent most common scripting bugs.

