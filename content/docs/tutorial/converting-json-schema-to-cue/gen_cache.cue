package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "jfEbTSe7qSCZzRSleBi4PCmRHTtKWjQHA0gfziyren8="
								"schema.cue":         "iKD/BMEMVrR2UYOyDSEcz34lqrW7XscResx21BBLZB0="
								"split_pea.yml":      "UxEgCk8nWpEluNf8r6tVMWJl9Sh1rS/8SX3/Xpl/1+U="
								"pomodoro.yml":       "Pt5o2CsF9LCtktGp5Odo3B/vanYAwn7hjVQG1S9sDoU="
								"pomodoro.yml fixed": "iKrYngHQKdG8RN6GyUeyk74mQ53lSnQnnfqlNHNACCE="
							}
							multi_step: {
								hash:       "SS1JHSITK2AVITGDUMB1T0HS8V74OFNSKTFE44GCUM0B0OB1OCB0===="
								scriptHash: "F13IT2J3MN36GG3N09O9518426I38RFFPOPK0L8BIOG0OSCEHI0G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0
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
											    ./schema.cue:12:17
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
