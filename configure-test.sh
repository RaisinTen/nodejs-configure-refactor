#!/bin/bash

# to check if any of the tests failed
err=0
trap 'err=1' ERR

# checks if the outputs of the two scripts match
# against each line of argument from args.txt
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo -e args: \[${LINE}\]
    diff <(python3 configure-argparse.py $LINE) <(python3 configure-optparse.py $LINE)
done < args.txt

# returns non-zero if any command failed
test $err = 0
