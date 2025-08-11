package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "15I54DW1iCGiA3HRhe+l5oAXgDL/SiCjZSLYn86vF28="
								"schema.cue":         "Et4cHjEhkBiOHZC2sRLDN6eKQfilC28tgbw7AE4q7Mc="
								"split_pea.yml":      "JJMAV4ge0I5j8vJtYlpSb6tl6pRtSSeLLONi4eewcuY="
								"pomodoro.yml":       "74lagKK+nhD4Y7gcNImHOBE85hySjGNmZm2t9q33Dhs="
								"pomodoro.yml fixed": "+Gzp7xz3KKyIf+VirTrPWS5q7n+/X6ufheaplOSif0s="
							}
							multi_step: {
								hash:       "FR75VS609QVES9POJBCB5RN7252B10S7M0M8FGOOBFBNGP5SAJS0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
