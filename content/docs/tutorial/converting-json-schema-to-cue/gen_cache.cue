package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ui6oWeMFqipwu4Jr08xLb4cNzBg1kGDS/qcU1lQgHbM="
								"schema.cue":         "2zoYBRGtK9s7XPDLxAmDNCx4XzW0ZclCYQOUgxm7fnM="
								"split_pea.yml":      "M1XjbRSwWmHfTEM+CV0iKY1LYIcgeONy6rYivDtXtfs="
								"pomodoro.yml":       "JsVk04uASXYyGFrnu5BN4SQqKMhnwgI21Vt6EONvkiQ="
								"pomodoro.yml fixed": "/k6rjQdcmGseN+r534IKeJKqOTK7W/QtQgBtEC07JKI="
							}
							multi_step: {
								hash:       "CP5QIBN7HKH0G4ELP2FUUCDQ4GQPNJM44BUF6G5FN0KQDEV41QGG===="
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
