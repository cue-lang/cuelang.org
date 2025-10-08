package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "8/sG6HXL43PKT8KMPdVMo82yg6TdZVW+QBnuXp4doYg="
								"schema.cue":         "TKddV8xQ3YX7h/K6Fby3ipx/L6VExJg25H8dJ3x+zSc="
								"split_pea.yml":      "q4fHirlEuZnYrWiDzBrqDc+1lKniVjoL7TECVsME/+Y="
								"pomodoro.yml":       "i5aDKtOWPL3vsbisps1FzOyqcIqDNAKvUtaRWOOz2C8="
								"pomodoro.yml fixed": "6zrnLzmZ8q/16T4V4Bal/wzwM+GPzYLP0yZWBVzFV3I="
							}
							multi_step: {
								hash:       "F57RF6OI0T0PANLV5FHJLF6P584JHK178GFV60AC0FTI1J96T8N0===="
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
