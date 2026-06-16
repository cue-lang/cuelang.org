package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "wyyn0Svj/H/q/nHAm0fNrlu4qMeROt+KAHjIPQ9hNG0="
								"schema.cue":         "ZK/klrRQqBHQJSQU5/Nkvvg/f6LCrOSLHocg6dp/g2s="
								"split_pea.yml":      "YeS6FrrMOjpY9UqH8XXvXf8jtKlnvKh2mIscdgTDo84="
								"pomodoro.yml":       "T2w7wuQ4DEnlws9GNbjGzUrQB751x+1XKmiN6y/L8sw="
								"pomodoro.yml fixed": "RLL6YlHXjwSXZArmQH5q0R2D3zd6xcilwuzsrf+rPe4="
							}
							multi_step: {
								hash:       "NGV82KURK0PPLU8CHC0VAL9IHOFEV5Q4MEE2O8QI0R8RBQCQFJAG===="
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
