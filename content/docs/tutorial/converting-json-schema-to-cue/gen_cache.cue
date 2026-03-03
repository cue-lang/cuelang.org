package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "PeD0+Cth0doTsiUPecOgxIMKpVa5fxE9RctrOsg5JhQ="
								"schema.cue":         "rSgwbg6ymUJN8XAQTD1fMjlY5Z0JvVjxh6JCvWQucqs="
								"split_pea.yml":      "V1Xg3OmPMO9XCYHBnwCYebYhmUD79H1N0HMgV49GzrM="
								"pomodoro.yml":       "mOS6wALdMPkkhzRtL06dvM4dFbZnURRmv0iCWlHg/ss="
								"pomodoro.yml fixed": "5lrzcT2w4YpH0P0AqcHJAnknipxwGBPgwIp7qBenIOw="
							}
							multi_step: {
								hash:       "5DI47BQFJQP12UFB91T6BBOP06S9N2GLJEHF2OO7H0ECV3THLJG0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0
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
