#!/usr/bin/env bash
set -euo pipefail

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/dockerImage.bash"

tag=$(dockerImageTag)
# NSC_CONTAINER_REGISTRY is set automatically inside Namespace CI.
registryTag="$NSC_CONTAINER_REGISTRY/$tag"

if ! docker inspect $registryTag >/dev/null; then
	echo "Docker image with tag $registryTag not found; cannot push"
	exit 1
fi

docker push $registryTag
