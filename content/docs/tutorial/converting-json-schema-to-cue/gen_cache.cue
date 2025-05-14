package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Nzjxzqr4gqTyhd02fhMwC6xE4Pl4jPm2cyUtALWabIQ="
								"schema.cue":         "OTj5FEs0PjLsmeRBI21rUDY0SZ2oVd9myhrdsDQXH9Q="
								"split_pea.yml":      "oU8PEUXwaVThJQ0yfJXdke/btxFd+vmT9+g39GQLQwI="
								"pomodoro.yml":       "IKGRfcD184WaetNNDeyJbycKWnABS0FMeVzMQQdbs3U="
								"pomodoro.yml fixed": "7N9m4+HKDqa9R5SqIXlj1FrlsZ8SI/WrQE0VYQWFB20="
							}
							multi_step: {
								hash:       "VQ8OVTVH01RK91F3T0IBRIICBME63Q3VDBLN02LOPTUUTA9ET3RG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.1
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
