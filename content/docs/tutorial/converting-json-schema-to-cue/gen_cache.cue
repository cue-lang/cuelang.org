package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Ht38YkxTKPKzAoPoSJpX+VX8jFlGDH/dVA423XajKKE="
								"schema.cue":         "j7o/nHM08vf5s7oUXITHnXSq3awr00pb0ZwkFhg9Rk0="
								"split_pea.yml":      "TUc47cYSmTUmaiaaw6tVagcY6o3hlU3la+8yZ7QcKMQ="
								"pomodoro.yml":       "OWF2AFKWEUYvpZfyngTSUIQr5csKfkV28/QlTYwzuaY="
								"pomodoro.yml fixed": "SJeko3pXzWDouveKKtSYxgTucegO8lFDGp5QaonIIBo="
							}
							multi_step: {
								hash:       "4MKKUG5SHRU3JV541K5BSET058LJ87HIJ1LCJH1VQ6EJ194FE6A0===="
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
