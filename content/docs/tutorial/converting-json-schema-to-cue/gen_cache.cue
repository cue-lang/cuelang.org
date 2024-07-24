package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "re8/3Y3hWuXmtNpoZ2u0S/AUvaJK76nYfkIICBqSCtQ="
								"schema.cue":         "ADMHwZUwOEAWZhAyf/wfX7nhEdxCkXhQwH8fRpQjiOE="
								"split_pea.yml":      "NwDAAFtk3grXEnkS3w3dcjxV5H8cthJpdbv5kcpVR5k="
								"pomodoro.yml":       "SyU8M53ggN///H9lX98arLLhbvcIgJRW/pANVcPfFQc="
								"pomodoro.yml fixed": "Yw+GJYQEPPBeQDHi0UrfkuCjlCCN7yWbN0x5GSViDAE="
							}
							multi_step: {
								hash:       "ME5C457TICO5FKHD0B0IF9J5C4NQ07E2F0JDIDIRJDGC7IBFQLU0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
