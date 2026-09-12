#!/usr/bin/env python3
"""
contribution_calendar.py - Renders a text-based contribution calendar.

Similar to GitHub's contribution graph but in the terminal.
Shows commit activity as a grid of colored blocks.

Usage:
    cd your-repo
    python3 examples/contribution_calendar.py
"""

import subprocess
from datetime import datetime, timedelta
from collections import Counter


def get_commit_dates():
    """Get all commit dates from git log."""
    result = subprocess.run(
        ["git", "log", "--all", "--pretty=format:%ad", "--date=short"],
        capture_output=True, text=True
    )
    dates = []
    for line in result.stdout.strip().split("\n"):
        try:
            dates.append(datetime.strptime(line.strip(), "%Y-%m-%d").date())
        except ValueError:
            continue
    return Counter(dates)


def render_calendar(date_counts, weeks=13):
    """Render a text-based contribution calendar."""
    today = datetime.now().date()
    start = today - timedelta(days=weeks * 7)

    # Intensity levels
    levels = [" ", ".", "o", "O", "@"]

    if not date_counts:
        max_count = 0
    else:
        max_count = max(date_counts.values())

    def get_level(count):
        if count == 0:
            return 0
        if max_count <= 4:
            return min(count, 4)
        return min(int(count / max_count * 4) + 1, 4)

    # Build grid (7 rows x N cols)
    day_labels = ["Mon", "   ", "Wed", "   ", "Fri", "   ", "Sun"]

    # Find the Monday of the start week
    start_weekday = start.weekday()
    grid_start = start - timedelta(days=start_weekday)

    print(f"Contribution Calendar (last {weeks} weeks)")
    print()

    for row in range(7):
        label = day_labels[row]
        line = f"  {label} "
        current = grid_start + timedelta(days=row)
        while current <= today:
            count = date_counts.get(current, 0)
            level = get_level(count)
            line += levels[level]
            current += timedelta(days=7)
        print(line)

    print()
    print(f"  Legend: ' '=0  '.'=low  'o'=med  'O'=high  '@'=max")
    total = sum(date_counts.values())
    active = len(date_counts)
    print(f"  Total: {total} commits across {active} days")


if __name__ == "__main__":
    counts = get_commit_dates()
    render_calendar(counts)
