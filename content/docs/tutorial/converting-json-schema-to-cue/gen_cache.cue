package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "EdKcoV5M0Rnqc7MkFBRgoAkNZMiTYKqpJrII0JLO+YE="
								"schema.cue":         "zVidcNlVsPzNbAeBrkGojqc/yvzTcs8La7BKftYu0RQ="
								"split_pea.yml":      "O04tO00LcGnQoP0rTJbon85eADCEqpF828xgBzxT1ug="
								"pomodoro.yml":       "tDBa9SEmM5W/Ivh777P49zQktPHplU+sNFRoqG4Yzak="
								"pomodoro.yml fixed": "K26/6pb5rtmoUBzW9JF0WUVhc3CVr7N050v4TDHiXgk="
							}
							multi_step: {
								hash:       "QDL38AKN93V6D57RMQ9NALQEJ2D1ME0RHLM091FO4DQTQIUHO8BG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.1
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
