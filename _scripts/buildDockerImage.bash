#!/usr/bin/env bash

set -euo pipefail

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/dockerImage.bash"

cat <<'EOD' > "_scripts/dockerRun.bash"
#!/usr/bin/env bash

# Code generated by buildDockerImage.bash; DO NOT EDIT.

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/dockerImage.bash"
docker run -e USER_UID=1000 -e USER_GID=1000 --rm -it $(dockerImageTag) bash
EOD

# Change to the directory containing the Dockerfile ahead of building
cd internal/cmd/preprocessor/cmd
tag=$(dockerImageTag)

cat <<EOD > gen_dockerimagetag.go
// Code generated by buildDockerImage.bash; DO NOT EDIT.

package cmd

const dockerImageTag = "$tag"
EOD

# Only build the docker image if it doesn't exist
if docker inspect $tag > /dev/null 2>&1; then
	echo "docker image $tag already exists; skipping build"
	exit 0
fi

caching=""
if [[ "${CI:-}" == "true" ]]
then
	caching="--cache-from=type=local,src=$HOME/.cache/dockercache --cache-to=type=local,dest=$HOME/.cache/dockercache"
fi

# TODO: pass in host UID and GID and Go cache paths to avoid using a buildkit
# caching layer.  This is particularly important in CI.
if docker help | grep -q podman
then
    docker build -t $tag -f ./_docker/Dockerfile ./_docker
else
    docker buildx build $caching -t $tag --load -f ./_docker/Dockerfile ./_docker
fi