package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "L+wfQ3I3hK2Xzh6WqMurt3aChCXhI1985BSCG3EnE3A="
								"initial x.cue":  "vBZ4FPalYuACAFhP2Wf6dCAOKsq0+hf5eghd2xv2PFQ="
								"another person": "zNSn4RUejx+G5EI3a4jsagD2c93MuVmLb2Mj6WF9j60="
								"fixed yaml":     "pf9bkHqL4BQqESQOOdzCkXQuNPhXCZhTGZQ0KUOSPTA="
							}
							multi_step: {
								hash:       "9H2U2RPL16L40LS32QGLDE2C7P6HAUIJU6H1KC9CP946CCNG3Q1G===="
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
