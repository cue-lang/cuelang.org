package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "hFN3CyuOyKcFg4HrjfFZAPMZI3PhsEIJE2sdtSVPupU="
								"schema.cue":         "hzU2hbBNlazoSz+SxMFvC16DdtxgmNWi32X2ITnUJGE="
								"split_pea.yml":      "MDGdLQjwZ71Lj74FDbIFKFbcYI+f3yc7OOqOQnWQ7XI="
								"pomodoro.yml":       "w4evgwhIJrFr3lU4TQaTbwQ3TQ+yB62jqe+j3E2BMy0="
								"pomodoro.yml fixed": "yGaUetfdbwsPSe5fvlGVlUjDWtCQhWAN4tymfydA604="
							}
							multi_step: {
								hash:       "C92GG4KIPRKFHQBH38J5AS6D6DQH8OMD67A7OUA74TDK1V657CL0===="
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
