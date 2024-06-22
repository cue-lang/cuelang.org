package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Vp+UuPwxySrhXPLqDh9s1pzC9CdGoFzaeEGFRZ2ptrM="
								"schema.cue":         "EeVadxzhnEK88o1uDUbrl7PUqi1wXC0LOMK+1wBkI14="
								"split_pea.yml":      "08nnAShgm8XAFR/GnmqDSLu5iyBY90QIbka60byiC+8="
								"pomodoro.yml":       "ZrYp7kJAlqZp9iePgyrM1JEAmNHnKyfBgGD/bcs5r00="
								"pomodoro.yml fixed": "EaZiYrvb2VyAemhNPyfMA9mP80PLV2Tpu2R5l8eKpFA="
							}
							multi_step: {
								hash:       "MMJEGANV9U5NMNRUP9NL129R71137FGAJFK7L8LR3JAQ35AQK6T0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1
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
