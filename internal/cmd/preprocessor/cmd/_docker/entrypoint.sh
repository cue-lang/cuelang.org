#!/usr/bin/env bash

set -eu

if [ "$#" -eq 0 ]
then
  exit
fi
if [ "$(getent group $USER_GID)" == "" ]
then
	groupadd -r -g $USER_GID runner
fi
# Now we know that group $USER_GID exists
group=$(getent group $USER_GID | cut -d: -f1)
if [ "$(getent passwd $USER_UID)" == "" ]
then
	tf=$(mktemp)
	trap "rm -f $tf" EXIT
	useradd -s /bin/bash -u $USER_UID -m --no-log-init -r -g $group runner > $tf 2>&1 || res=failed
	if [[ "${res:-}" == "failed" ]]; then
		cat $tf
		exit 1
	fi
fi

# In case we didn't actually create a user
# add the $USER_UID user
user=$(getent passwd $USER_UID | cut -d: -f1)
usermod -a -G $group $user

# We are still root at this point. Ensure /caches exists and that everything
# inside /caches is rwX for all.
mkdir -p /caches
chmod a+rwX /caches
if compgen -G "/caches/*" > /dev/null; then
	chmod a+rwX /caches/*
fi

# Create the home dir if it does not exist
mkdir -p /home/runner
chown $user:$group /home/runner
cd /home/runner
export HOME=/home/runner

# Set a umask to 0000 so that writes to /caches (if that is a mount) are done
# so in a way which won't conflict with users of other UIDs in other
# containers. Worst case, writes to /caches between containers will interfere
# with each other but this will be caught in CI.
umask 0000

exec setpriv --reuid $USER_UID --regid $USER_GID --init-groups "$@"
