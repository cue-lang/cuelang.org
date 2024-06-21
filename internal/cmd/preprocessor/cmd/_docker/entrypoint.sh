#!/usr/bin/env bash

set -eu

if [ "$#" -eq 0 ]
then
	echo "nothing to do; exiting"
	exit
fi

# We are still root at this point. Ensure /caches exists and that everything
# inside /caches is rwX for all.
mkdir -p /caches
chmod a+rwX /caches
if compgen -G "/caches/*" > /dev/null; then
	chmod a+rwX /caches/*
fi

# Create the home dir if it does not exist
mkdir -p /home/runner
cd /home/runner
export HOME=/home/runner

# Set a umask to 0000 so that writes to /caches (if that is a mount) are done
# so in a way which won't conflict with users of other UIDs in other
# containers. Worst case, writes to /caches between containers will interfere
# with each other but this will be caught in CI.
umask 0000

exec "$@"
