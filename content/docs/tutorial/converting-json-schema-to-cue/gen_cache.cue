package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "RS1cfQhuDwy/eCy9by9gA03/4BSQd8URuOJUXdOLBrQ="
								"schema.cue":         "QSVF7WUt2UsIE/Zg1Syzwex+itqPtZtK3TPbDAUh3a8="
								"split_pea.yml":      "5rpGJXpGcjW5ksQTI3ZTITXIsz9vXcmxHC/WVfzrWDA="
								"pomodoro.yml":       "Zc21jXydXlYVHY37NSeB1pjlS1eAJsg/GuEUaoE37ns="
								"pomodoro.yml fixed": "KnFJhGi5vpLU4l3Obdn30yXiEI96neFdyUg/SSWUv5U="
							}
							multi_step: {
								hash:       "E2S0FBH325FORDPLUAKAOCCP8BLJE48B8STVM8JA5171SI9AF8NG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0-alpha.1.0.20250103143946-3f4e72d4d171
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
