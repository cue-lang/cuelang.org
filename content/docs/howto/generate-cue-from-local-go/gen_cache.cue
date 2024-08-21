package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "f7uYymnwZ9pTL8Iz34/krL+8UQ8Qs8wTonwQvTz2jv8="
								"config.json":   "ieiELSiPYU0p7veL8thq3EjE2eicx+0Fg2eKm4bTB6A="
								"generated cue": "rD64KJF9lfavpzhj85V/C5Ziq54DNjRIgs1uqlkPnL0="
							}
							multi_step: {
								hash:       "3MM4K4Q6VM3S5JAS1E6D6210UOQKS93L9HSM5O93RM4Q5S8939GG===="
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
