# Signal Handling

Use trap to register cleanup functions. Common pattern: create temp dir with mktemp -d, then trap cleanup on EXIT, SIGINT, and SIGTERM. This ensures resources are freed even on unexpected termination.

