# Generator Patterns

```python
def read_chunks(file_path, chunk_size=8192):
    with open(file_path, 'rb') as f:
        while chunk := f.read(chunk_size):
            yield chunk

# Pipeline pattern
nums = range(1000000)
evens = (x for x in nums if x % 2 == 0)
squared = (x**2 for x in evens)
top10 = list(next(squared) for _ in range(10))
```

