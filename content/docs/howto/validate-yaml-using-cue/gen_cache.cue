package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "otmiuVptVde7ZxoGpxCQ0dtq6qhAxqRsVnYJubr8mjc="
								"initial x.cue":  "84Xy7J11tFLY2XKEC+f4kddYBM1OZLyyr8xm2T+uja0="
								"another person": "9Dnn3jPT6Vh0aCsvuY3AGSQnAQjen+29IAjGwntsEes="
								"fixed yaml":     "WMcVI13JI2RC13rV0k1aIf+v8AGCiSFLYlDd/o3oXpM="
							}
							multi_step: {
								hash:       "0BAQ2VEFSRLVBQG2MEVOJPJF4NE1LV9KI9P49TA3LUTE8SE91REG===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
