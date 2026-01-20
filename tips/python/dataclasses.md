# Dataclass Tips

```python
from dataclasses import dataclass, field

@dataclass(frozen=True)
class Config:
    host: str = 'localhost'
    port: int = 8080
    tags: list = field(default_factory=list)
```

