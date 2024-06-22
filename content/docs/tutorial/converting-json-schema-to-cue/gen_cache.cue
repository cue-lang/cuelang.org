package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "cG3plNqBz1RLspDCRwrx9lCFu8WsIH6PTTToNzo9Qro="
								"schema.cue":         "PES5ERO1vpBNP0c7cXDF5xnXWGUKclZGuWalbgJHqU0="
								"split_pea.yml":      "1KNMbm+5lWG10vCJchO/J2Rft0LBd7hIgFxN5Ebwv7Y="
								"pomodoro.yml":       "j20Uum79CKlq46Y96Z3ZfOY8FwEpMS0Y7VfM2dzNf8s="
								"pomodoro.yml fixed": "eHvfqCRmlnlSz/49Atv9f56E1oH/iixwft583gn6Yw4="
							}
							multi_step: {
								hash:       "B02KEJDFPL0NF9L2RM9P9668A3VVK7JLLGBTVEUDD4O0SH1B8P20===="
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
