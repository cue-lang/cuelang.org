package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "dRvkhYgQZqRGtUkxzsTeswYiA5YbUpfkiUrgghihrgU="
								"schema.cue":         "zhdBUWPnIXpBy315owiJvVDruSnb+9f0ihNHsF4Ut7Q="
								"split_pea.yml":      "7I50R5OJZbHP7+BR1CF/Oadi5ABRhMvK9g5sg3VojWY="
								"pomodoro.yml":       "bLlrDXrXhlilX0tDIKiCmVflhC81hCwwV6BHr6LSlBo="
								"pomodoro.yml fixed": "52HbdFODlWxRoahXKcfzLrZKrbFZBjxJcQZ3yHLonzY="
							}
							multi_step: {
								hash:       "CGMDP746LQVGHHRE1JS26GPCJCEFFL3ERUEVN704J5D35PUEBR4G===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
											    ./schema.cue:13:17
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
