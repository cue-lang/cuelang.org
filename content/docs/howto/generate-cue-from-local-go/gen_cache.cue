package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "nackQsdz/HP3zZfZmZ5mG7UppD1s6qKVa8WemyFUZLM="
								"config.json":   "p+ZhJQ7Jb5kwAuvuIkkck/JKu6LXMv3THKe4JJlc2SI="
								"generated cue": "v/MCIiQDa4oMPErciu3UIuwYslUy1+JOXeake/pgpME="
							}
							multi_step: {
								hash:       "2VJ60TJM4VI8OUBVKE8NU8HNTO4O89634K6OGQ3COMS2KN967MNG===="
								scriptHash: "DF9MSVF3K3RQES8FHOGAE3T2H6R4UD144QBFLUA58NJSEFUPVUT0===="
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
									cmd:      "go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./..."
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
