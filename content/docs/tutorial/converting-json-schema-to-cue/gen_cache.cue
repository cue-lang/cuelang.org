package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "oxtBLHUzy9M8uOFrCIEbz/LkIchzETRYpUIkJkAFkEQ="
								"schema.cue":         "gP2XCGXYMxo/BB+GLbgEKXchHgKG+h80ROWZASnUzCM="
								"split_pea.yml":      "IkefWRrc/Yu6dDO9MpZzeM9XvSbwJbKkmQkqwm5+ZBg="
								"pomodoro.yml":       "5BwIAmqK887byieAhah7oN+/6GzIcSeVrPvfkd8BryY="
								"pomodoro.yml fixed": "5mwm3ELHptLBdhSsdGpsofBxDpZAFxs5klBqlPNa3hM="
							}
							multi_step: {
								hash:       "SD42G43OEGVLLVG2EG8GRSOPJG479DNQE3LDIE87I7F0ALHJE64G===="
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
