package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "JBo/A7m/uCr0YUdA54K88OpWnzzP6gOi85AHPWf5jwc="
								"schema.cue":         "F/SPpHY5jTnI+TrRCUum/6N0wSiNRxlcHrR4vPfbpYc="
								"split_pea.yml":      "KKC1EfpZRjWya/G3LbK3njrlmHXE8BIbpqejFZj8rLI="
								"pomodoro.yml":       "fBfTz0o6mAHRO25okUI0hgR8ugLi/du7zatVB94l2M0="
								"pomodoro.yml fixed": "azqrD21XQO7ay2SQCSG8aH24NS3CPCrXbwkKUar6Z9E="
							}
							multi_step: {
								hash:       "E49OL6GJSK304T9032GHA3ENAFBF8SODG0MRKJMT4I58G85UDUQ0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.2
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
