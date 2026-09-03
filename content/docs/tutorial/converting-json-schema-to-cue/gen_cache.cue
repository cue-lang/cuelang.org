package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "00oaQfQaXYgSQx4EsKRPTLRj+ZHklFQNoaympITJDzk="
								"schema.cue":         "hDhaB8lVYNT9ZflT695boiPPEptORDr081F3OeJB4Mc="
								"split_pea.yml":      "Cl3TuoNyK9yuNf3wc8ApJ5n5OvNojCQJOTa5uJkneg0="
								"pomodoro.yml":       "NP462YhWa2enTne5mWn+I8YKka7KCR8aK1pwny/pVuY="
								"pomodoro.yml fixed": "zAfy/7dAHy/Wa1yxBFD79/vDhRs0PSS37Ws3H8jvik4="
							}
							multi_step: {
								hash:       "TJK346LA671D7752Q7O070BD66RUGHKCCPC8H9389JAOESS9ILJG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.17.0
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
