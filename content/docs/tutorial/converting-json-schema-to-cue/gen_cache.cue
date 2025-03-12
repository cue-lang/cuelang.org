package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "smCHf5a1NN7vJJjoVCarybyLqLMzVS/QqBOowrDP5o8="
								"schema.cue":         "g+AwHTfEu5Ds0TPvwPxRaojiCwnjs9lNetXqrk6H7bo="
								"split_pea.yml":      "w4fOKvrAsURiu0SuD+w2E/Nu/FuwAddixVOCCGcIvew="
								"pomodoro.yml":       "OdIdVUsdqqgO/XdlUuXqP4cNhTTKlPVUtc++qnwBHi8="
								"pomodoro.yml fixed": "yRWCfi4KCy364H6TXCSCToAlur85Zvl4iHd/JttmUyk="
							}
							multi_step: {
								hash:       "OJGKUI3I9GQK41JNG43SO252RVF8006JG9DSIF6KOHDKG0N5PJ40===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
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
