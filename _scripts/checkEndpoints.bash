#!/usr/bin/env bash
set -euo pipefail

# Usage:
#  _scripts/checkEndpoints.bash https://cuelang.org
#  _scripts/checkEndpoints.bash https://a-preview-site.netlify.app

site=$1; shift

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

go tool cue cmd checkEndpoints ./internal/monitoring -t schemeHost=$site
