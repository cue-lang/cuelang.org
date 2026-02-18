package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "5AL8bS4sHwCuK95+BrShqXk1poGc4qyNVfbdeFtBPZo="
								"config.json":   "fa3r3jFP2LH0oh6Orz1lyHemM4BAzyFW6nrizn6IrhM="
								"generated cue": "zSVC57N8tBf+EIQxqOK5EGVXMFSUomnbfOhEZtteCDA="
							}
							multi_step: {
								hash:       "NM4GITCGVVFC073GMBM7NEV7HU7UESMMDH6LCENETVANQAEF0GNG===="
								scriptHash: "0RQ8RVSNQUNNNMA2NE0MC219CD0QGKAAQ601JTFASE94NQCDRNJG===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export STATICCHECK_CACHE=/caches/staticcheck"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "go mod init an.example"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init an.example"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat config.json | go run ."
									exitCode: 0
									output: """
											Config level: 42.
											Val count: 2.
											First val name: "cueckoo".

											"""
								}, {
									doc:      ""
									cmd:      "cue get go --local ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#Config' . config.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "go vet ./..."
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "staticcheck ./..."
									exitCode: 0
									output: """
											...

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
