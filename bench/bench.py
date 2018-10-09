import statistics
import time
from collections import defaultdict
import random
import string
from prettytable import PrettyTable


# import KV stores
import redis
import plyvel
from pymemcache.client import base

# Anything that abides by this interface is a DB
class KVStore:
    def get(self, key):
        raise NotImplementedError("base class")

    def set(self, k, v):
        raise NotImplementedError("base class")

    def delete(self, k):
        raise NotImplementedError("base class")

# KV store backed by python dict. Used to check sanity of KV
class DictKVStore(KVStore):
    def __init__(self):
        self._kv = {}

    def get(self, key):
        return self._kv.get(key, None)

    def set(self, k, v):
        self._kv[k] = v

    def delete(self, k):
        self._kv.pop(k, None)


# Redis KV store
class Redis(KVStore):
    def __init__(self):
        self.r = redis.StrictRedis(host='localhost', port=6379, db=0)

    def get(self, key):
        return self.r.get(key)

    def set(self, key, val):
        self.r.set(key, val)

    def delete(self, k):
        self.r.delete(k)

# LevelDB KV store
class LevelDB(KVStore):
    def __init__(self):
        self.db = plyvel.DB('/tmp/testdb/', create_if_missing=True)

    def get(self, key):
        return self.db.get(key)

    def set(self, key, val):
        self.db.put(key, val)

    def delete(self, k):
        self.db.delete(k)

    def __del__(self):
        self.db.close()

class Memcache(KVStore):
    def __init__(self):
        self.client = base.Client(('localhost', 11211))

    def set(self, k, v):
        self.client.set(k, v)


    def get(self, k):
        return self.client.get(k)

    def delete(self, k, v):
        pass

# config
CONFIG_KEY_LEN = 10
CONFIG_VAL_LEN = 10
CONFIG_NUM_QUERIES = 100

# immutable vars
GET = 0
SET = 1
DEL = 2

def rand_string(N):
    """Generate a random alphanumeric string of length N"""
    return ''.join([random.choice(string.ascii_uppercase + string.digits) for _ in range(N)])

def get_legal_choices(ks):
    """Get the legal commands that can be run on ks.
       Returns: GET | SET | DEL
    """
    if not ks: return SET

    return random.choice([SET, DEL])

if __name__ == "__main__":
    times = defaultdict(lambda: [])

    for kv in [DictKVStore(), Redis(), LevelDB()]:
        # current keys
        ks = []
        for _ in range(CONFIG_NUM_QUERIES):

            choice = get_legal_choices(ks)
            if choice == GET:
                t0 = time.time()
                kv.get(random.choice(ks))
                t1 = time.time()
            elif choice == SET:
                k = rand_string(CONFIG_KEY_LEN)
                v = rand_string(CONFIG_VAL_LEN)

                ks.append(k)
                t0 = time.time()
                kv.set(k, v)
                t1 = time.time()
            elif choice == DEL:
                ix = random.randint(0, len(ks) - 1)

                t0 = time.time()
                kv.delete(ks[ix])
                t1 = time.time()

                ks.pop(ix)
            else: raise RuntimeError("unknown choice: %s" % choice)

            times[kv.__class__.__name__].append((t1 - t0) * 1000)


    # finallu print data
    t = PrettyTable()
    t.field_names = ["KV", "#USES", "MEDIAN", "MEAN", "STDDEV"]
    for name, numbers in times.items():
        t.add_row([name, 
                   len(numbers), 
                   statistics.median(numbers), 
                   statistics.mean(numbers), 
                   statistics.stdev(numbers)])
    print(t)
