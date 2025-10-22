package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "nt4gths3gN0XySmWVQTJqT/O+UPb5W9aLLB637yJJs4="
								"initial x.cue":  "WJBQHrHsvXruBqcYWMEnUGDSi/Djx0QKx5tmlzxEPUM="
								"another person": "hu186KmVo7aaSlS8y5rrXFbC8fqWaZMcVE030Eu5Dec="
								"fixed yaml":     "xzNQcxij34aPjpoLRj9BB3jbAwTC2LH/inImY9pVI2Q="
							}
							multi_step: {
								hash:       "4QTUV2IPUEKV5FS7J9P4OG4UJ30MMUTE9PR74CPO34CO6CL9OG60===="
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
