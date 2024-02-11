package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "FMT16zisu+e6XBxLTEzl7uzkn1zw1+8LHxACU6/qbxs="
								"initial x.cue":  "/V4BX+gwEd+WtCq1fEc1o8xmlIUVQWACKwSu9bsPlzg="
								"another person": "nHsspZHl27AL8kRFT/h27ESZIO9vOjyOkuYnckK5oFg="
								"fixed yaml":     "TEDSZ/B5oSYq/RBlcc2naVAV6gDy+0sDyeyzbuo6/k4="
							}
							multi_step: {
								"OF0222UQN7TKIRO68VR9MLOJ0I45P9726O0U1P2QAVKJ94ORL7T0====": [{
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
