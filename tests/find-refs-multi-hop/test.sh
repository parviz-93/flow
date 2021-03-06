#!/bin/bash
. ../assert.sh
FLOW=$1

echo "Simple object property multi-hop find-refs:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root usesFoo.js 6 5

echo "Superclass member:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 4 3

echo "Middle class member:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 8 4

echo "Subclass member:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 12 4

echo "Object type related to superclass:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 20 4

echo "Object type related to middle class:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 25 4

echo "Object type related to subclass:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 30 4

echo "Unrelated object type method:"
assert_ok "$FLOW" find-refs --multi-hop --json --pretty --strip-root classes.js 16 4
