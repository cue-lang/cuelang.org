package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ja44btSW6+fpVmMg1ZtKd37ug4H/QlS+GKYOMkzOMgU="
								"schema.cue":         "x1bQDNfvcKaJyfGcQeSvbdNEHPnQm5/2CgWZCZo0LXY="
								"split_pea.yml":      "cSVGXMX+xMvDw8UW1ZnpdAkDvZk3v926JMC5OHJ6zMA="
								"pomodoro.yml":       "Mo3vMspdRuKGlbuxpvsG4bIUwjtX4pFISoEAyEQevhI="
								"pomodoro.yml fixed": "bpF97ctdN2CAifsfEVQSTgu4BV5bvipfeA/pBjzvfTQ="
							}
							multi_step: {
								hash:       "57S84NRKBF3NIN8QBH4S49ADQ3PH4RVK0VBC81FA31KE8APU72HG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.19.0-0.dev.0.20261119142547-4feb85fac20e
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
