package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "HEQaPgjFsEHgyrNJ4VhNmcXJ2jlo26I3M5+doPpWUUk="
								"schema.cue":         "iWRG1jPV1HkX8GMuE4SFf8sWifjs/uIrAoUELQo8YL4="
								"split_pea.yml":      "mJBlACMwQCZAsOBQj1dPcGg382QFgfAisDF93s6LQ2w="
								"pomodoro.yml":       "SukbFhURrBrC/pT3m4pMje0igoU/efJ5Qzxe8uHdBDE="
								"pomodoro.yml fixed": "jY5xl8qEgLopEsfAte3bOu9RAG9RftndDYOnY7EXmw4="
							}
							multi_step: {
								hash:       "9IEOO7BTJQFL6MFNC1NEJQDR5B8FKAUN3A6IRDNA8I3CC5OCOEB0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.2
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
