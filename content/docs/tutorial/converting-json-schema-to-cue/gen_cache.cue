package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "b5mTj7zDjxPmiIE8fZA/wmM99R/6JKMG5puMRRGBDzQ="
								"schema.cue":         "0nmjPCQ2ls0b7HUgT+ZPB+2bvVrdEfkEhEd44hfZm5Q="
								"split_pea.yml":      "Ry1yVI4OCCs+uAmYMUti6l8ZUWVwAzZPZCE3EZQ8YaQ="
								"pomodoro.yml":       "8onF3iRWHhhFmQXAXDXnBrelKH693BTRH5QlZahSBQw="
								"pomodoro.yml fixed": "hp/aa9HcaKb1MQ8rza65BWWv5hXOurMF8WGIFYjhl6k="
							}
							multi_step: {
								hash:       "F1L2SU8SOUCLQVNR5DCD859P7F4VN1R83HLCJHFRQGGEEO3AQBBG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
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
