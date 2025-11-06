package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "4mdc54BiiaSdq3+ts/gK35x9RNkzvNggGbuc3ISINqw="
								"schema.cue":         "75QrtDNALXNMQN7M5qVWkHACquFXO+4nT5OD4bL9NuA="
								"split_pea.yml":      "GjXviLppDcLIax3LpxsbkBcASuaR9E3SKF4lbr+4hXo="
								"pomodoro.yml":       "kY6Z9ZMnkYfU1M+Llo67XTb5zrVAQK+5+aduTIBe7j8="
								"pomodoro.yml fixed": "7rL/O/qwdyCpGCKmw/r0y53qXXbt4Kx/u6Bmus6jDUA="
							}
							multi_step: {
								hash:       "BT7IM5DH9KVUMFC2RVF61NFKL2LABVQ68V526GD5AHLUOAC5GEUG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0
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
