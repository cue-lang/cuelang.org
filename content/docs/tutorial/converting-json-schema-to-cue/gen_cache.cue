package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "MQFQfXAEuSBZ516QOXGvfD21KqTbHsnXjvBqDYXZDpw="
								"schema.cue":         "L/mavBrVTrHGk5BAdgarCGxkeh6DLEFq+zfnteGDZLk="
								"split_pea.yml":      "H4MxbhHNsqaS5DYE8m3TcwDgJZgRhx42DGKj5iD0MrM="
								"pomodoro.yml":       "rWihTY2BRatJg9giyIzLCKrk2saEfmvXjAZE7uN9VMs="
								"pomodoro.yml fixed": "BMo1h4vLdDo8UTjEzPOjf9dd/MZxTkwONApgk2ZEfGw="
							}
							multi_step: {
								hash:       "6HGHDAM2MLAJLQPL9KLJD6S48D1NR96JI7E5FGESTVPVO67I93E0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1
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
