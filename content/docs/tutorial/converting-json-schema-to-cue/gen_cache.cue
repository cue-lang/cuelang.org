package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "+AxVeyLouKUy/8kh+x3VwpQBuqyDMMViTFp4tIiBIdU="
								"schema.cue":         "PlWyg5gNvuGXYAIfoSqqlxh5SISgg3F+ujsxzlI+zFE="
								"split_pea.yml":      "+WxMKZYCKNi0clSTNAXf04Qwyk3I1PLXhwZBd0/lnwM="
								"pomodoro.yml":       "2epkt9QUF2A7ow56egc0iQLYQCHz1JOEaaM6wq5L9qU="
								"pomodoro.yml fixed": "XpF9oahW0/FufBySN2u6wNs6yYhvSnAknfq/YnaU7aA="
							}
							multi_step: {
								hash:       "Q9BDUQGNDNA8H89VM5MC6L966L3H7SH21DVSKBTQC641RO51LF2G===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.2
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
