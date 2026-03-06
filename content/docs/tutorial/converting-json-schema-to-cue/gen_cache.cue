package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "loorFTqKk6cWzVd4h9WEIEIUBYGfa5dt92ZKxYeR9cE="
								"schema.cue":         "bGDWotvm5MrDDx3jxtfPXxBRqcu5MmQt/e7G58ObYl0="
								"split_pea.yml":      "vVDYGFijj3NB0YlC7HLETQf4XA2lLk0QxcukXQhkq/A="
								"pomodoro.yml":       "A80VBD0hGg5etppMu3TPLSN6BBQB25joHEy6Wlit9GU="
								"pomodoro.yml fixed": "OCN6wryImUJ/K10MH2JfFnd+JAtzCW8JYQT1UXZuGdw="
							}
							multi_step: {
								hash:       "CADSTHP27SP3ML7BKA62SP77MOEF50D8LSH8JSSSEO0QELG7EA2G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0-rc.1.0.20260306143617-9147ea2b06d9
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
