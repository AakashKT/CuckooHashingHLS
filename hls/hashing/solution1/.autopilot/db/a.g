#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/bollu/work/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.g.bc ${1+"$@"}
