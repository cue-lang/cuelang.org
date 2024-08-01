package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "wAGTx5jdK+c8LGGMucyRJEDtXgA6IuUfg7WQZjRJ1gg="
								"schema.cue":         "pEdk+xOx6dfO9R6UeFyPci0Hgw2ZsSEAjfkqrfwWFbA="
								"split_pea.yml":      "mwSUrz/lnwTbAnvBfVTuqKEcI39aUkF/jvL00QySnPM="
								"pomodoro.yml":       "RXfA122YpBlwqMUDzKtyzTsBWGz8/W4Gr9s4tQjT0Ks="
								"pomodoro.yml fixed": "wX7jQ8w49p4zt8YIMKQ6SxGOWIFNU7tzHhzgsBi9YRE="
							}
							multi_step: {
								hash:       "AJ1SSUT2QKS2HIL3PNI245L9PQF0A241UV8TS9E9UKMK4RA9EGEG===="
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
