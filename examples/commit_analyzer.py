#!/usr/bin/env python3
"""
commit_analyzer.py - Analyzes commit patterns in a git repository.

Reads git log output and produces statistics about commit frequency,
active days, and contribution patterns.

Usage:
    cd your-repo
    git log --pretty=format:"%ad|%ae|%s" --date=short | python3 commit_analyzer.py
"""

import sys
from collections import Counter, defaultdict
from datetime import datetime


def analyze_commits(lines: list) -> dict:
    """Analyze commit data from git log output."""
    dates = []
    emails = Counter()
    weekday_counts = Counter()
    monthly_counts = Counter()

    for line in lines:
        parts = line.strip().split("|", 2)
        if len(parts) < 2:
            continue

        date_str, email = parts[0], parts[1]
        emails[email] += 1

        try:
            dt = datetime.strptime(date_str, "%Y-%m-%d")
            dates.append(dt)
            weekday_counts[dt.strftime("%A")] += 1
            monthly_counts[dt.strftime("%Y-%m")] += 1
        except ValueError:
            continue

    if not dates:
        return {"error": "No valid commits found"}

    return {
        "total_commits": len(dates),
        "date_range": f"{min(dates).date()} to {max(dates).date()}",
        "unique_days": len(set(d.date() for d in dates)),
        "emails": dict(emails),
        "by_weekday": dict(weekday_counts),
        "by_month": dict(sorted(monthly_counts.items())),
    }


if __name__ == "__main__":
    lines = sys.stdin.readlines()
    stats = analyze_commits(lines)

    if "error" in stats:
        print(f"Error: {stats['error']}")
        sys.exit(1)

    print(f"Total commits:  {stats['total_commits']}")
    print(f"Date range:     {stats['date_range']}")
    print(f"Active days:    {stats['unique_days']}")
    print()
    print("By author email:")
    for email, count in stats['emails'].items():
        print(f"  {email}: {count}")
    print()
    print("By day of week:")
    for day in ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]:
        count = stats['by_weekday'].get(day, 0)
        bar = "#" * count
        print(f"  {day:10s} {count:3d}  {bar}")
    print()
    print("By month:")
    for month, count in stats['by_month'].items():
        bar = "#" * count
        print(f"  {month}: {count:3d}  {bar}")
