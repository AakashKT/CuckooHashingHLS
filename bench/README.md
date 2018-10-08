# Benchmarks

We benchmark:

- redis (leading) uses hash tables
- memcached (leading) uses hash tables
- levelDB (ordered mapping from keys to values) uses log structured merge trees
- our FPGA implementations

# Setup

```
pip install -r requirements.txt --user
```

# References
- [key value stores, memcache internals](http://key-value-stories.blogspot.com/2015/02/memcached-internals-design.html)
- [Redis internals](https://redis.io/topics/internals)
- [LevelDB internals](https://www.igvita.com/2012/02/06/sstable-and-log-structured-storage-leveldb/)
