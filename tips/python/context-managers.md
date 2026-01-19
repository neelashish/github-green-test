# Custom Context Managers

```python
from contextlib import contextmanager

@contextmanager
def timer(label):
    import time
    start = time.perf_counter()
    try:
        yield
    finally:
        print(f'{label}: {time.perf_counter()-start:.3f}s')
```

