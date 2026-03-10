#!/usr/bin/env bash
set -eu

# gerritComments.bash fetches review comments from a GerritHub change
# and displays them grouped by thread with resolved state.
#
# The argument can be:
#   - A change number (e.g. 1233340)
#   - A Change-Id (e.g. Ia15e97465869aa18ba2b8c9795cec18f438d7b76)
#   - A git ref (e.g. HEAD, HEAD~2, a commit SHA)
#
# Usage:
#   gerritComments.bash <change-number|change-id|git-ref> [--unresolved-only]

if [ $# -lt 1 ]; then
	echo "usage: gerritComments.bash <change-number|change-id|git-ref> [--unresolved-only]" >&2
	exit 1
fi

arg="$1"
unresolved_only="${2:-}"

# Resolve the argument to a change number.
if [[ "$arg" =~ ^[0-9]+$ ]]; then
	# Already a change number
	change_number="$arg"
elif [[ "$arg" =~ ^I[0-9a-f]{40}$ ]]; then
	# It's a Change-Id — query GerritHub
	change_number=$(curl --netrc -s "https://cue.gerrithub.io/a/changes/?q=${arg}" \
		| tail -c +5 \
		| python3 -c "import json,sys; print(json.load(sys.stdin)[0]['_number'])")
else
	# Assume it's a git ref — extract Change-Id from commit message
	change_id=$(git log -1 --format=%B "$arg" | grep '^Change-Id:' | sed 's/Change-Id: //')
	if [ -z "$change_id" ]; then
		echo "error: no Change-Id found in commit message for ref '$arg'" >&2
		exit 1
	fi
	change_number=$(curl --netrc -s "https://cue.gerrithub.io/a/changes/?q=${change_id}" \
		| tail -c +5 \
		| python3 -c "import json,sys; print(json.load(sys.stdin)[0]['_number'])")
fi

# Gerrit REST API prefixes JSON with )]}' — strip it with tail -c +5
curl --netrc -s "https://cue.gerrithub.io/a/changes/${change_number}/comments" \
	| tail -c +5 \
	| python3 -c "
import json, sys

unresolved_only = '--unresolved-only' in sys.argv[1:]

data = json.load(sys.stdin)

# Build threads: group by root comment
threads = {}
comment_map = {}
for filepath, comments in data.items():
    for c in comments:
        c['_filepath'] = filepath
        comment_map[c['id']] = c
        parent = c.get('in_reply_to')
        if parent is None:
            threads[c['id']] = [c]
        else:
            # Find root of thread
            root = parent
            while comment_map.get(root, {}).get('in_reply_to'):
                root = comment_map[root]['in_reply_to']
            threads.setdefault(root, []).append(c)

# Display each thread
unresolved_count = 0
total_count = 0
for root_id, chain in threads.items():
    chain.sort(key=lambda c: c['updated'])
    last = chain[-1]
    root = chain[0]
    is_unresolved = last.get('unresolved', True)
    state = 'UNRESOLVED' if is_unresolved else 'RESOLVED'

    if is_unresolved:
        unresolved_count += 1
    total_count += 1

    if unresolved_only and not is_unresolved:
        continue

    filepath = root['_filepath']
    line = root.get('line', '?')
    author = root['author']['name']
    ps = root.get('patch_set', '?')
    print(f'--- {filepath}:{line} (PS{ps}, {author}) [{state}] ---')
    print(root['message'])
    # Show replies
    for reply in chain[1:]:
        r_author = reply['author']['name']
        print(f'  >> {r_author}: {reply[\"message\"]}')
    print()

print(f'Total threads: {total_count}, Unresolved: {unresolved_count}')
" "$unresolved_only"
