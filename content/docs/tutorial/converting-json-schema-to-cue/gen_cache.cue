package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "IlR6BBUQ2/wm24l0cUIRJiCoyOOAAj8iKg1idQoyKs4="
								"schema.cue":         "5G+x0E3XO7qQrAZ7gCapLQ68bm8Nj2sq0eG0um1HN/M="
								"split_pea.yml":      "JAN0fJgmVNI4XjFYPI2epkl2fQzb36evvO1kH78uYkg="
								"pomodoro.yml":       "+JW39aLumFdxSP2qpDuawJoxhJXy0uzQ0l0WEH9NeZI="
								"pomodoro.yml fixed": "1auuXqQP1RRRJ5PFy8NYOP3pevVQJ7E52+7SKdRs0Dc="
							}
							multi_step: {
								hash:       "TN2SQKL7OA474NHQNM2OD6OOMLAS1TKBHC039PU7UEOL398AJFHG===="
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
