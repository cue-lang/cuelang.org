package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "UFJlK9z7WmxXcLlbBMbPn19wdQjem7+RXyXJjNOThWU="
								"schema.cue":         "NZvuUpz4zarPkk5pDdJUmUVW2edTS6bZwr2GZBn9e/0="
								"split_pea.yml":      "JoaS3KILQF2eWqG9SmkaZRmtWzPY5+FFxZAZtxuIWFw="
								"pomodoro.yml":       "DDSt+oIA/ZdPGS7xSt458C0Rv61rUg1EOowo0hlMWG8="
								"pomodoro.yml fixed": "iIEAVi0N6rvg4OuKw2SQgwNPZcl5k4/QDYUEDYW/C88="
							}
							multi_step: {
								hash:       "OOOEJG0R0NJQVIBKD8O4A3CR85DD0CP7F12CEH3N4A6EHPHB3SMG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-0.dev.0.20241218161113-f2775f863f4c
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
											    ./schema.cue:13:17
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
