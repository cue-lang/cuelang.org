package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "h2FLp6qF0pNgU5k13iKq6Fpc96JS8K9zg7qA0XQ4zYo="
								"schema.cue":         "NKyY+S4FhMyN4zQcnxavOa9Hag0/g72A+fHdxV2nBKw="
								"split_pea.yml":      "ncCRQFnOrSBkeFI91UCL5tnrud/De3bhZYIwBPkS0yE="
								"pomodoro.yml":       "eKDjiP35sHe7Lv/k74V4rPzYhNvq0GeylTiMy4QGm3c="
								"pomodoro.yml fixed": "lCmzyM8aSIhlMHAIo/M2HfbrQUQyI0o70I5O4hQJUyI="
							}
							multi_step: {
								hash:       "2SDD6OAO75UBER924OR19H8TRFDP8QNL406T9GLE1LTBOQ9JROPG===="
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
