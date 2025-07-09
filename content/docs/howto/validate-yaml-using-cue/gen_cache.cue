package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "8wu4UkZVqK3/IRaUQJZQMBNNRSw3hOGzcCGvkoFmwss="
								"initial x.cue":  "k4sZH+8Q2M2IH4DcvOjY16TXkqE/DzfEqdnKF9DPXxI="
								"another person": "ZT4L7evHleQjGchiM6fnHbH4NCxcIxF9BoXL9DS4vn0="
								"fixed yaml":     "tNJHAG8Ro0H1QDIdoC6m4lUYQ7Y25+snvoLgrtowjOI="
							}
							multi_step: {
								hash:       "NKTCSGBV1E2S4VQF9LIF1MNJK5FIOOHNQ03D3DB3SQCCIG5Q76FG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
