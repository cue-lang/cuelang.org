package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "+wJBuhRHAr7SSwiCSo5sjNBywaV6Y9bQiXEPjDFtj6I="
								"initial x.cue":  "LQnR44fe9ylA8dMifPvGWWCGo4JI4JWEDQ9PvfKc26Q="
								"another person": "bueyKEjsdd4OnYQDnTVghzXb4xnb4HvWTJDGZ4kiZHo="
								"fixed yaml":     "aeeFxdaUqy61+EmI6xb9f4XF1SE2skD1zVk7MZJeHpU="
							}
							multi_step: {
								hash:       "NUD7S3DSHMSQK2KTRMARI1MF5FL0BDJUM2PDIRUKFMG9V4CSN7CG===="
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
