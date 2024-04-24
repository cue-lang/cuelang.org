package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "lsxNaGd4DDj7ReZgIhvNWWUUusgNKMwOT4uxjOyORRE="
								"schema.cue":         "qfyawzhmX1ntpEezH4+/LuR6+yUiITU9Eej+29LoL1Q="
								"split_pea.yml":      "7pWkW9NzZ0coS+jYcZK+yumt4UZsvsCoRLSImIFBXF8="
								"pomodoro.yml":       "CKOxdXPyjbGcgL/5ug9nf6aR9QbsKOeKByCCg8IE+u4="
								"pomodoro.yml fixed": "TY09qrc8sy5itBUNja6C6HU57VTBjQfbfKx/4WGRADs="
							}
							multi_step: {
								hash:       "0UU6BU082V04DRLQUN5SENNTEVI3DQ9M7EPLTH1DDLD6KCUKM0D0===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
