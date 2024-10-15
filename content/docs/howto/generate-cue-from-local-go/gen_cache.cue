package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "XHJA3yImihC4LCRzQIdenLa9Qaf0kHRFP3yUvpKIRFg="
								"config.json":   "gWmYaaDXxapJXwbS6cN1YYE2aniK4YtXr84X80gPDNM="
								"generated cue": "aNCcYpndtwrA3+a59n8wQxDeR8GNCKx40PEWZ5t20Ak="
							}
							multi_step: {
								hash:       "LKCRSAK2JQOL63P24E6A11NAICNOAR3HLUNHU7AHITEJNS6DP3J0===="
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
