package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "dUjDxWSgL+Im5NZfCpoPZuf/w2KLPKir3S1ia4eAolc="
								"initial x.cue":  "WfJj/fVNt98t3tSlHiUa53vRbV3HwPt+skTuH9msssU="
								"another person": "O9lFZh+LgJ/OYkqUsgmidIPG+4WxoDq6yCwNb78mhc0="
								"fixed yaml":     "wS2LOYTeVQYztZxHzYzPNQAl0K4yVOaNrdS4/bgLMA0="
							}
							multi_step: {
								hash:       "M91839QN5JKBBK7PLHB1UO75POC6VJ2U3QM760EMP0BU8H66F3L0===="
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
