package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "DwdIOVYaJx6OJ6ggAa6MoK8iHrSd78gHIDSd1Reo1fI="
								"schema.cue":         "0Zzp15WWFLzFOgWSnPj0Dx9LlTVE69TvcFakZrVOBsc="
								"split_pea.yml":      "lvgTv4jKR0NmWBO/5gdUD81SeI7qLxgjRVBl7dwCRCs="
								"pomodoro.yml":       "HCbJ0K3E/FyChZVsCcSEM7F3SkdH7clT0yKduyqXdsw="
								"pomodoro.yml fixed": "lREdgKcubJ6ULXkcmZAonlGvUYE5q831h3DVI1n9klw="
							}
							multi_step: {
								hash:       "SJFH3R25EE4534GTMB13QN4TT1V41PIGVB13UB0605CM79KO7OQ0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.1
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
