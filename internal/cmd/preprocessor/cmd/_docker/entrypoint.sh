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
	useradd -s /bin/bash -u $USER_UID -m --no-log-init -r -g $group runner
fi
# In case we didn't actually create a user
# add the $USER_UID user
user=$(getent passwd $USER_UID | cut -d: -f1)
usermod -a -G $group $user

# Create the home dir if it does not exist
mkdir -p /home/runner
chown $user:$group /home/runner
cd /home/runner
export HOME=/home/runner
exec setpriv --reuid $USER_UID --regid $USER_GID --init-groups "$@"
