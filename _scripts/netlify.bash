#!/usr/bin/env bash

set -eux

# netlify.bash is used to build the ensure the correct env for any commands run
# in Netlify.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

source _scripts/env.bash

"$@"
