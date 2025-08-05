# A "library" of functions that are common to Docker-related

function dockerImageTag() {
    echo "preprocessor:$(dockerImageHash)"
}

function dockerImageHash() {
	root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."
	cat $root/internal/cmd/preprocessor/cmd/_docker/* | sha256sum | awk '{print $1}'
}
