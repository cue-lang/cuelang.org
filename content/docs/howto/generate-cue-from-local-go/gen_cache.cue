package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "gcj/p9xSxLZoSTMjUJiwbVYfcTaoP3H1dFzVWpT6eqw="
								"config.json":   "1Y8FOOVt0VprWgtoeRfdZs3a/BeGjEpjqcgthcw+/jc="
								"generated cue": "2JsaxxR2DfqE9Ud3rRWEmMqrTrL87iJTwG/mOe7+UhI="
							}
							multi_step: {
								hash:       "BQU46AN1U18R5F0JIEHU9UJVH99II3TS0T9V7QF4P80IR2TQ6BPG===="
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
