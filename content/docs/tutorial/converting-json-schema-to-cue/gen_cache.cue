package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "AYpzQA8baeIZNNCgYIAPKCs0u1fyzv+AJppGRfnnE6A="
								"schema.cue":         "cTBMSfP0RMnUt9ms40CaA7usC7+W/1AFQ0+BgGz28HI="
								"split_pea.yml":      "97+0apSz2ULW3REV2MTH3oDcrRQHrUftJ31PTAKD5l0="
								"pomodoro.yml":       "e9Y2lc6VOr8dWA8Z8pqn4ChVspGFC9BjUFXkuOi4WnE="
								"pomodoro.yml fixed": "lvt5Egb1695RZVoapNNQDoMwDsqLtFDSN9azTPBW1Bc="
							}
							multi_step: {
								hash:       "7N3T4SAL9SSIMGURPUNLQDFOD9CHP9721H3V5P9E7LBD5SMIV0NG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-0.dev.0.20250606135340-250524b0d6e0
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
