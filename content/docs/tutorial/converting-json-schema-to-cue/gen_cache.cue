package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "8M1600F1Hb3bjJ2AK2VC5qZZ37qeNx7PQO7dq0SDm18="
								"schema.cue":         "HSoKAQlNUnSBalXZoW+fQjnl9TqVSgqPRJ/GMLeTv1w="
								"split_pea.yml":      "MA69i8Yp88pRRoyveYD1Q8ypxyWuVUmbBl9JuDl66+o="
								"pomodoro.yml":       "KEQvE0WpO1PPLpQXy/yUH/d6Dt9Xf5pb4Y5oVO/wJeI="
								"pomodoro.yml fixed": "OtQMlpIwE70E0J9gVk4dg2DppXpomiMtPYIo7XC20Ao="
							}
							multi_step: {
								hash:       "QVRBO85I2SMDC3510C56D171LDBSP5SFHE3KVRUPVBN38B5NRSMG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.3
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
