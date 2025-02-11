package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "IoKu2jBX/EEQm8Udlcx0vELHe5GQMVVvpr8QunQepZ8="
								"2": "MfX4XN143I4Exbm9pm868IoMJxWKn01FCYtG6HLQRQk="
								"3": "8ry81gthbxOIb0LPxke4V53CiMcwMaWWnkpuLmXBOO0="
								"4": "daBDNzWSrhX5u07+jDqSYfsC2nwAgLfI7ZBWvEhXgOg="
								"5": "H+uf9V/QR6WJLD2DDUpLhiwHEqVz11Cg+B2y8fw6nCo="
								"6": "Ut2nOwftzKp5Z779fhEobsHq1LKiH2AarMHvlfIv/M0="
							}
							multi_step: {
								hash:       "VIQ62SIJ5EG91LE78MK7KFL1307LLGL8I5LEDEVPLSPRUD8I9E60===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
