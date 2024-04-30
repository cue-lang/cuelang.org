package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "glaZFNzWRXZXXUzTvrSFgMysR4wnpB3AAdGT/Aoqb7g="
								"schema.cue":         "87xzm05EXVFmLVtzk73dfytZTjKtVEQltkRd9HuV35U="
								"split_pea.yml":      "Z6xEBTZvXfoNoJsXQ/f3WU2JapGsvgsNlSdxFJJTD2Y="
								"pomodoro.yml":       "/H2YEqvO0ioQWqeeBBbbLyoGvlhUp8/D+++7+g5Gvl0="
								"pomodoro.yml fixed": "qGvVJNsVfQGYtvLQ3sXjeRJe0c56waMpUKvPxR3yEYc="
							}
							multi_step: {
								hash:       "M0KEIGE8UA2JACIOJSFTIHCRHJAE6THL1P3C8L77PH8SD38F70QG===="
								scriptHash: "MQRDITM8NL559USLJT9HK8L6S45EA9V3HGD6OUSOM28STMHPF2K0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-alpha.3
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
