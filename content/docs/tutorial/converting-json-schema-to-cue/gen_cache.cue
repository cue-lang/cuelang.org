package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "kpjP9k5p2To9W0+G6ZOshDwgymsBcAUmOOSkyEc2c9U="
								"schema.cue":         "cuIMRnCYr+CGA4C821l0rrCFp5vqp0CTkab9xc26VUw="
								"split_pea.yml":      "a+arwDxglg2lTYvh2hLWFpz2vIljLZ3MVF5IhbYCRf4="
								"pomodoro.yml":       "XejeZS7uAM2vrtSENdQX8Ffmdfa6l0twSBo5WP71bno="
								"pomodoro.yml fixed": "CaUti4s0sqB2VqrRj39YDHiz4KA9qu3NZY+fLZSPqlQ="
							}
							multi_step: {
								hash:       "2FB8V7KQIAGS4RIA4UP58U5839HHQICMD9ETL83GRNMQS8J3ULO0===="
								scriptHash: "F13IT2J3MN36GG3N09O9518426I38RFFPOPK0L8BIOG0OSCEHI0G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241209170035-d298a53db8bc
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
