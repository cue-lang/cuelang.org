package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "wJtp5BZ0KpxBeTIJM56Zn4xoobaPVPOsATIgkWfR+EA="
								"schema.cue":         "d5e7fhLDHscfRdDWebaZcyA+TJwPGqLwd4vs1SZ4k5c="
								"split_pea.yml":      "uN250obcI3KYh5P+2Y135W7nlIabMllD9xwIXQ3cn3c="
								"pomodoro.yml":       "8F88umlm6Y0YIkKyLs+LAr8qYpmNTY5+ARiRTaSnHzM="
								"pomodoro.yml fixed": "DI1wRN7jIJddJ9GlFdXLkIt0dWynsJnXmPrzLPduGgo="
							}
							multi_step: {
								hash:       "5FT8RU0NEJVKHAFJGS08RTB5TKTJAA5FU18V8K21T58Q796JOHE0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-0.dev.0.20250905161001-20531e1837bf
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
