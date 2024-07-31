# A "library" of functions that are common to Docker-related

function dockerImageTag() {
	root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."
	echo "preprocessor:$(cat $root/internal/cmd/preprocessor/cmd/_docker/* | sha256sum | awk '{print $1}')"
}
