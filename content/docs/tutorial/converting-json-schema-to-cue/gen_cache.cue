package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "e+rjK6LjM4pJ9bT0dpBHga1f4gm8xPylgFwVjjUbDvA="
								"schema.cue":         "VGSippVwTldRIwXf/JJpKJwAg1ieOSOXzRlvPfN530Y="
								"split_pea.yml":      "7iTyEPDBq4LF5LiOWqowEtHNvtVtg14D0gO9Ynn3MME="
								"pomodoro.yml":       "wYcmq8MfSGDEqgiWkIMoUqi85Z8z8vTxaNr1gr8iad8="
								"pomodoro.yml fixed": "d/7Hw0UkdcZmhjePdoiBudD06aNZnig6LHuQn3HSk84="
							}
							multi_step: {
								hash:       "NOJ07ATU36G6QGMPSER6OACGK0G7OJ90Q777PE41BRDGPDS14H30===="
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
