package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "vyAzzQlEQcH2MWYKjj6tU2n3Anj5cYvzSjkhrIxMd+A="
								"config.json":   "5OM+ILFnlip2HhNhrPmg+QT+vnBWzIMw5F18jjEUgGI="
								"generated cue": "njgHkFu8Aud+xDFgdWM35V6mLXDIUd6p9f3+wsvLJ9E="
							}
							multi_step: {
								hash:       "052DJ2RHS1L9RN98P2QKLODUK6QTO5480D5DFFH0HIS5CDCCN44G===="
								scriptHash: "EGOF21VDDRFL5HLSM92O86BM1AGQEMSR8QI97R0MPTO6LIT2RB3G===="
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
									cmd:      "mv main_go_gen.cue .main_go_gen.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff main_go_gen.cue .main_go_gen.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#Config' . config.json"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
