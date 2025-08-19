package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "9FThqbhlm+pn5cuUO1JJJ5R3QtohtThX26CCyGK346U="
								"schema.cue":         "ck/BB50fILJcBlxAL0K5pxYCwKYiDcnIq3Cwyk3ziS4="
								"split_pea.yml":      "xj6Xok1jmBw5WuBvfJOXRbA3Zhuh++fXIwEiV1g1vco="
								"pomodoro.yml":       "RM+w/Hx2Z48xRmTH0KfcACSFViSBf9VSz/Ftwf6vU6I="
								"pomodoro.yml fixed": "ta+/A7avTizeDQz4FBQMeFh5TUFcb1nvc7EK5ZymAmA="
							}
							multi_step: {
								hash:       "STHLOEN9LTF7AP2E41BCU7AAEBK7OJH9OMPKOF165MM4KOJI0HT0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.1
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
