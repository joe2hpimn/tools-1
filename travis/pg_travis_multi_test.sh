#!/bin/bash

set -eux

status=0
testtargets="check-multi check-multi-fdw check-worker"
testtargets="${testtargets} $*"

# Configure, build, and install extension
./configure PG_CONFIG=/usr/lib/postgresql/$PGVERSION/bin/pg_config
make all
sudo make install

# Change to test directory for remainder
cd src/test/regress

# Run tests. DBs owned by non-standard owner put socket in /tmp
make ${testtargets} || status=$?

# Print diff if it exists
if test -f regression.diffs; then cat regression.diffs; fi

exit $status
