package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ZzI6ZvB858padAEanUKr4XVk611aNW5PiFLFgLVj9zg="
								"schema.cue":         "5HDBiEwzrThkDfy4J04sRV0of35ilibMDCJlDSPyOes="
								"split_pea.yml":      "hnBoyLbj2vk8NHEST6436E1Zac3S8+UB3016TKTR6ug="
								"pomodoro.yml":       "Bx4qOXfdmVITYHAX2jAiA1A5DUZWlCYrJcKphSSp9KM="
								"pomodoro.yml fixed": "hphrWtB7ONP3D4rNIuzoiBaFWNrCosvVeQ0ZWtui9Ow="
							}
							multi_step: {
								"V25ANQCV181SMS0QU2MU1RSODQA2GLVJURE9O6U0FF187NG0NTR0====": [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
