package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "p7PO4nGvzTajKTzmCc/DgVAHiiBuXcbbJVZWctoxNnI="
								"schema.cue":         "nApCabhdlxQ5uFk8mspPnCZF4qPQd9Oe5ERUWOBxWAo="
								"split_pea.yml":      "gvvh7xCuwUcTgqc/5AZBkY+Bmr/H3C0RMXJr0UcXCZc="
								"pomodoro.yml":       "itn8fiRLcSmQAjeT6bL/wxKqdjnYisn0FNAThMLDHPs="
								"pomodoro.yml fixed": "a0QRaEA7OeEvJgnxRtd//3w2xl/CPjsGimFMQYBDRmk="
							}
							multi_step: {
								hash:       "8PACSA57B1SRERC6V9B6FNF9FUD5N6VRC94GRDFMNJ9ARHN8LR20===="
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
