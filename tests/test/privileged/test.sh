#!/bin/sh

#
# Variables
#
SCRIPT=$(readlink -f "$0")
DIR="$(dirname $SCRIPT)"
DIR_TESTS="$(dirname $(dirname $DIR))"

DIR_LIBRARY="${DIR_TESTS}/lib"
DIR_RESOURCES="${DIR_TESTS}/resources"
DIR_TARGET="${DIR_TESTS}/target"

#
# Tests
#
. $DIR_LIBRARY/testbase.sh
. $DIR_LIBRARY/functions.sh

# 
# Test Runner
#
(
    rm -rf $DIR_TARGET
    mkdir -p $DIR_TARGET
    
    (
      RESULT=$(install)
      assertEquals "install to image" 0 $?
    )

    (
      RESULT=$(go_version)
      assertEquals "go is installed" 0 $?
    )
    
    (
      RESULT=$(minify_version)
      assertEquals "minify is installed" 0 $?
    )

    (
      RESULT=$(simple_site)
      assertEquals "minify a simple site" 0 $?
    )
)