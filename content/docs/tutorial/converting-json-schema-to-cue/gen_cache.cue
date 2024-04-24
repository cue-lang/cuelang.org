package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "/D0ifkmesT3LhnTpSwWlavgwXPeFzK2Fby18uPR1AYs="
								"schema.cue":         "PtyNb+YRh+xBOAdJfLtOylk3tCbilEVifbWQx2jgcsY="
								"split_pea.yml":      "cQ1FnYkeQh8+n+AlmJFK5/tmYc0Uf4UYOK6z3oGqPBQ="
								"pomodoro.yml":       "u7AdmYBMgkhQcY0hSBw1aKCMbQL3xjE17v9HZ+NzTRM="
								"pomodoro.yml fixed": "4WKFGRVWpvMYS92bs3bJko/Ip47Z9RxgmhfKW0EQOEY="
							}
							multi_step: {
								hash:       "SMP8NO11CVUF15DSVNPQU7DT2J110PAIG0OQA4AINU0SS9LR4LP0===="
								scriptHash: "371283LR856JI9DINL6CM8PG1SOSHKKGI610TKJJNU4V9CL0M36G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.2.0.20240424105213-3519740dc4cc
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
