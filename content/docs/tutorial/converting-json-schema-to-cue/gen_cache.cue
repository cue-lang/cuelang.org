package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "zXRtIbQFMbriX46h07/ps95MGw/JrXAEarPX9pvNl3g="
								"schema.cue":         "sGrwjzeAXvFMxnyGOr8r3BZ67SfCayJt+42aAETKQnM="
								"split_pea.yml":      "iNQHrbhKr83GphwuzWfRvl7MzEZp72piGG/Pe9fo2hk="
								"pomodoro.yml":       "H1QWBk3Dwk/mtgcFfehqy+wjWr7GznMARnUv3ZLnDtE="
								"pomodoro.yml fixed": "eIrd5tf2wD9o0uSXNvZQ8DwyYhZggSZdI2D3veqXJ7k="
							}
							multi_step: {
								hash:       "M8O7MHN73HJCRRII76660D6UDVGI2D5R0EEP7QHL2P9EH57ABFI0===="
								scriptHash: "371283LR856JI9DINL6CM8PG1SOSHKKGI610TKJJNU4V9CL0M36G===="
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
