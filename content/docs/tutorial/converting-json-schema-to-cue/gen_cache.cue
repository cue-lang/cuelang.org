package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "YZP1ayAC05tcxkhhZL9Oln7A7cZnn4dORWr/wWJ5XMo="
								"schema.cue":         "tpZ+WfZvYjrzY/nJJFKJo2JPsEWDH4rc9T2/vgIEJ/0="
								"split_pea.yml":      "bTPo+iB9uQw8bJx8lfyYgVBonUjszcrqGDaSfxwO6Jw="
								"pomodoro.yml":       "jN4DDWfpv/yiDvVT8JFuJkLWVPjECV3Dt+NubSuhhdw="
								"pomodoro.yml fixed": "FMc+/hjtXsteCTOpKnm9rLUiySTQhUnimRGlTmSh1IQ="
							}
							multi_step: {
								hash:       "9F7TE2VRDA7PFDSOS3S813HU743MVTT3M5CROIN7UCPLU70E5QH0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:10:16
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
