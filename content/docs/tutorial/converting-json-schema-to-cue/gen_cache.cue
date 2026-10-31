package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "P1rJRs9AJBeSlUTrg7pvYv81hwu97KuHjeSvN95PvUw="
								"schema.cue":         "Q1IoGi+qua9YtO8zEA7th1r7m4CtdchDT+EhXboNkRA="
								"split_pea.yml":      "DIqLi1tH3RFcUzxW1Uek4pJpkUvehVyyRLaI4MGfT9w="
								"pomodoro.yml":       "t8m4u7Dy/qwRUhdDtS+bRA8SseCPioUaaymSszQPQYI="
								"pomodoro.yml fixed": "lIjmbvu0qHgwrByetqa/kJKRwQhy2CvFyjJwTb95utk="
							}
							multi_step: {
								hash:       "VU0768TM90TNP91HUHDRFCTDH1FJNGLU9KOD50VRCJ1I77DO3080===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-rc.3
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
