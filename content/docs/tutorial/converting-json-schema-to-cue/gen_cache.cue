package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "VWtRuZKCWNpqSrVzJKqFj3jBlAVJxTQ8MoWWSFKEJZE="
								"schema.cue":         "7Wma7zivs2ejVGFwXApf1nbbwKYu9ZVfHo9rA5HLX6I="
								"split_pea.yml":      "DjFrkRabkXNt/LqXt2sKyB22To4JqOn1XBD2UOklROE="
								"pomodoro.yml":       "RSZQLZV3Y06v4kByIdLZ+xUJPNK3xFuI5fBNQC9w4dQ="
								"pomodoro.yml fixed": "GtUeq/QQ3LYR2I9itklNjxRy8pOp4yee++DAnHXNTYs="
							}
							multi_step: {
								hash:       "GT11UOFEJP2IIQAKSFLGVRL2SCVGSG1TCSM501PKO0RM3QQ56J20===="
								scriptHash: "S1P1N4BEQ13PVKLHR7S49GT6BCDNEBPHJ3GI7AJEV2HUL129L28G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.3.0.20250411164907-08c3542c9d96
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
