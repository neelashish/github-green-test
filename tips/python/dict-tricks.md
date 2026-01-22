# Dict Techniques

```python
merged = defaults | overrides  # 3.9+

from collections import defaultdict
groups = defaultdict(list)
for item in items:
    groups[item.cat].append(item)
```

