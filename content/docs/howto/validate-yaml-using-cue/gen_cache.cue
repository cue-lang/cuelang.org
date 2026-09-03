package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "VrxPPO4x4VjwZ2e/7B8xK5s/Ug/zTAWy/HiP/k8njJA="
								"initial x.cue":  "NL5aolMDgf27uAYpP+d+rT44qoX1Aa9oVH5jJ3v0+gU="
								"another person": "ua0c1VTn0WzLRBUZ6S6QdGLF5V10Ah41DSlQ5LEeWJI="
								"fixed yaml":     "rtGv+rHJ2PLg23nQDWPSI1oEFxC0FZJn5wEz6mmOBdc="
							}
							multi_step: {
								hash:       "UMRO99FQ3750QJ2PI0ACSMT6BNNQ6PT9KR7Q5J4JFGQSJ6K0UATG===="
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
											    ./x.cue:7:21
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
