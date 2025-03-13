package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "SVChxsiuWALaenPTK9K/E9xCcGHEA/M/jsc3PAelGv4="
								"initial x.cue":  "rGoVT9cfbaB6xvJiamKS6/im2N2GNV26nOwjLpyMlOE="
								"another person": "CT1ilSLMV9upiRMvrUeAw1Xi8USVodqLRkVpqQs5iQc="
								"fixed yaml":     "impvPRpDLgjVVqil8C/j99r6PVJmJkMoMN5aMykhg7o="
							}
							multi_step: {
								hash:       "TPAHB3F59CTD1R6IAPJA9GVB5NNRR5V7E54S5MOVJCT3CREBU22G===="
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
