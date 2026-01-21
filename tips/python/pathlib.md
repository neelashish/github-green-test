# Pathlib Guide

```python
from pathlib import Path

config = Path.home() / '.config' / 'app'
config.mkdir(parents=True, exist_ok=True)

for f in Path('.').rglob('*.py'):
    print(f.stem)
```

