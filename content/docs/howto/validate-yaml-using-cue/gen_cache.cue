package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "vyrq5zAxoHu63wHaEUXO8GX9PRv6ITUa/NRN11anxWo="
								"initial x.cue":  "mL89hYsAaIJauGyq9h4drSl39WY5E+dQCsX5ZDxtcfE="
								"another person": "Xua67BFFeqi3Z4l/dR76N1IEAbhSwDRh3v1TNfrxbM0="
								"fixed yaml":     "FsLRp0P32Qebn2GIrO3BxTkXcar0CcPsDS0H81uwxqE="
							}
							multi_step: {
								hash:       "BH19R47B2T7RI0IV17TB9PVR98ADIUKL94F8GJULML7NN3LAGBJG===="
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
