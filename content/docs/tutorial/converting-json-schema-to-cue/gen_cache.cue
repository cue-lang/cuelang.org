package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "hqCCLlzwJEGr69WjUt3ilXcb6+a6swa9Xo+w+FrpfjA="
								"schema.cue":         "5TvEIeVveyBAJT3Nl0zux4eQg0UnrIjDIvWTLNpoLJ8="
								"split_pea.yml":      "AsP2yMOv2GSUxifMxbh38+3Pg+V737R7rzoyJgN+U+Y="
								"pomodoro.yml":       "Pnyl7Rd5rT9LUdc0ZqWEtCS83aaJSE+rJMNRgTL2bAA="
								"pomodoro.yml fixed": "R9jP9BQQ///nwifOCcaj7BAQ363PCrr1QEFpeh1FKCQ="
							}
							multi_step: {
								hash:       "338IIP8NU9O8BFSMIATC16GEMPUGQGSFKSCN8DO6HRS5E4NKE4FG===="
								scriptHash: "KB4BPO7OCPKI6VF8CNIJN5JS65L6MVIO6TQGTDN6KSP4S2F37JSG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.10.0
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
											    ./schema.cue:10:17
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
