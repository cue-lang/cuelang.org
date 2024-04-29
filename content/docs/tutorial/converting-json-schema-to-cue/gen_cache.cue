package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Whni3zgWYlxV6Bg9Qn6cHQihTwFaHzVVjCbn7bSlh3w="
								"schema.cue":         "vebjeXwF+cOVr5nLrg9/rlL3nlY6ooew32VU2Jmza8E="
								"split_pea.yml":      "uskHvdzaK3VCjk+5s+o7xVNN0/zGyK+STQuzegqSey0="
								"pomodoro.yml":       "4oftu2JoT8ZE+BSPzGp+KzIC0lYaco54SYLH7Mu8v8g="
								"pomodoro.yml fixed": "CeGMcM89HWs+uXBW9qI17OVI1/KIvtci9c5G2btL3Dw="
							}
							multi_step: {
								hash:       "L20CM606AKOE6JEMT24A902U4MR2KAQ9E88E8KGDK26M64QM3EKG===="
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
