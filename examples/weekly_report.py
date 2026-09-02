#!/usr/bin/env python3
"""
weekly_report.py - Generates a weekly contribution report.

Reads git log and groups commits by week, showing activity patterns.

Usage:
    cd your-repo
    python3 examples/weekly_report.py
"""

import subprocess
from datetime import datetime
from collections import defaultdict


def get_commits():
    """Get all commits with dates from git log."""
    result = subprocess.run(
        ["git", "log", "--all", "--pretty=format:%ad|%s", "--date=short"],
        capture_output=True, text=True
    )
    commits = []
    for line in result.stdout.strip().split("\n"):
        if "|" in line:
            date_str, message = line.split("|", 1)
            try:
                dt = datetime.strptime(date_str.strip(), "%Y-%m-%d")
                commits.append((dt, message.strip()))
            except ValueError:
                continue
    return commits


def group_by_week(commits):
    """Group commits by ISO week number."""
    weeks = defaultdict(list)
    for dt, msg in commits:
        week_key = f"{dt.isocalendar()[0]}-W{dt.isocalendar()[1]:02d}"
        weeks[week_key].append((dt, msg))
    return dict(sorted(weeks.items()))


if __name__ == "__main__":
    commits = get_commits()
    weeks = group_by_week(commits)

    print(f"Weekly Contribution Report")
    print(f"{'=' * 50}")
    print(f"Total commits: {len(commits)}")
    print(f"Total weeks with activity: {len(weeks)}")
    print()

    for week, week_commits in weeks.items():
        dates = [dt for dt, _ in week_commits]
        start = min(dates).strftime("%b %d")
        end = max(dates).strftime("%b %d, %Y")
        bar = "#" * len(week_commits)
        print(f"  {week} ({start} - {end}): {len(week_commits):2d} {bar}")
