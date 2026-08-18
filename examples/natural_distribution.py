#!/usr/bin/env python3
"""
natural_distribution.py - Generates a natural-looking commit schedule.

Rather than committing exactly once per day (which looks robotic on the
contribution graph), this script creates a varied schedule where some days
have 0, 1, 2, or 3 commits, weighted to look like real development activity.

Usage:
    python3 natural_distribution.py 2026-08-01 2026-09-26

Output:
    A list of dates and times for commits, suitable for scripting.
"""

import sys
import random
from datetime import datetime, timedelta

def generate_schedule(start_date: str, end_date: str, seed: int = 42) -> list:
    """Generate a natural-looking commit schedule."""
    random.seed(seed)
    start = datetime.strptime(start_date, "%Y-%m-%d")
    end = datetime.strptime(end_date, "%Y-%m-%d")

    schedule = []
    current = start

    while current <= end:
        weekday = current.weekday()  # 0=Mon, 6=Sun

        # Weight commit probability by day of week
        if weekday < 5:  # Weekday
            num_commits = random.choices([0, 1, 2, 3], weights=[10, 50, 30, 10])[0]
        elif weekday == 5:  # Saturday
            num_commits = random.choices([0, 1, 2], weights=[40, 45, 15])[0]
        else:  # Sunday
            num_commits = random.choices([0, 1], weights=[60, 40])[0]

        for _ in range(num_commits):
            hour = random.choices(
                range(8, 23),
                weights=[5, 10, 15, 12, 10, 8, 10, 12, 8, 5, 3, 2, 2, 1, 1]
            )[0]
            minute = random.randint(0, 59)
            commit_time = current.replace(hour=hour, minute=minute)
            schedule.append(commit_time)

        current += timedelta(days=1)

    schedule.sort()
    return schedule


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <start-date> <end-date>")
        print(f"Example: {sys.argv[0]} 2026-08-01 2026-09-26")
        sys.exit(1)

    schedule = generate_schedule(sys.argv[1], sys.argv[2])

    print(f"Generated {len(schedule)} commits across the date range:")
    print()
    for dt in schedule:
        print(f"  {dt.strftime('%Y-%m-%d %H:%M')}  ({dt.strftime('%A')})")
