package site
{
	content: {
		docs: {
			howto: {
				"generate-cue-from-local-go": {
					page: {
						cache: {
							upload: {
								"main.go":       "vLjDpZ0gh+UCtwMmT0h6pUtJ4xPN4mEu6b/BZxPHn8g="
								"config.json":   "jguyeTAJYMNIhGRCy9baTcBj7fwiqH10pg5Na1roBWM="
								"generated cue": "R/b+xYXFI82kA1lv+4kTCDQ/2MmyZUha+1Npocm3Vyg="
							}
							multi_step: {
								hash:       "C21F6702RB37BKF66JHOHB5MDGSJH12BTOMSMUJU99737176O29G===="
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
