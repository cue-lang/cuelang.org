package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Pz7OLWfba2wwR6mOkd9JLpS6ilhaYqLbOgdfHdjXdDY="
								"schema.cue":         "QWajRDsUDjaT3IHjfbYGeFICgOx5DjdETHQC17YuhXA="
								"split_pea.yml":      "AMi+UKmPyYoqBZKhOKF06VXJtJLl1kcJmICRrPPstog="
								"pomodoro.yml":       "5Hui4jFkXD6n03WccNnFDwKQRRcLopgYBVn1BKDQGGI="
								"pomodoro.yml fixed": "C27lcxN3BW2O/hT2ENbt7/7tzwcACbd2d6qWVi7vQyA="
							}
							multi_step: {
								hash:       "52I4NJDMOOI96D65USOMS094O2EC9V8FNQOT8TPPNGE2J6L32FU0===="
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
