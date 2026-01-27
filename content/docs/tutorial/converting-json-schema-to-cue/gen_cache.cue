package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "or8LxAunzFYIoFZqCdwvaT86HN4kX1IBgw6IN4gXXyQ="
								"schema.cue":         "nn2oQtgfQDcA38l2z2ySXszw5PvpooFHj8+GpatqDuo="
								"split_pea.yml":      "ScCODuPmRaz2NM9/tUGdHma71n5sbfkgh92C+hfU8i0="
								"pomodoro.yml":       "5Q4F+Lsi2IN7LfJDFZ/S5F3jFAh+lyBsacXhvrR2UdY="
								"pomodoro.yml fixed": "OJX9qIt+ovODFBf99dWQzIJfLA6zxh7HQntpDV3Myzc="
							}
							multi_step: {
								hash:       "DB33C9PFODTJJR7MA1THKUJ6535BARMIT14Q20EBI1QSFM635DK0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
