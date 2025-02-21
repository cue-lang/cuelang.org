package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "pAIjYiAX+BqHeCCL4ywQKyp3fzkdgU4V0gicRU4SuQo="
								"initial x.cue":  "J80ykxMa2GVxOQOVX6aWix/+O1ximRYni5orKookyYY="
								"another person": "njZDiwSCDKYE9qZy6bEZbE/n6AWMaj+WV06onSdZkps="
								"fixed yaml":     "JZZFAPcb1XEw8cyWjVtaFjobNKkvyUPm3EyY6qcTcZI="
							}
							multi_step: {
								hash:       "2QDV54NN1H92G2OJ6QIGOU53VLG1HSNIMCU3BADR2CGO2B73LGCG===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
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
