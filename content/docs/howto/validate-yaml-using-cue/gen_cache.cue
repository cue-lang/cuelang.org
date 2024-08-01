package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JHegj4TLgLnBYqDazBwuoTyRLHWiQuaxerx5oCsyAEY="
								"initial x.cue":  "NbE3Xshffv7dfluNKGUTwkn1C66rq31aO835gDQTDvc="
								"another person": "xMtzOoehpjDD7EzNVIAcuihwvQv7vPV9kz35dxXrMhg="
								"fixed yaml":     "6WcIM8EtuKHKeIXB4m82LG7gfxZ9Fbq7uWAXiZ53+ts="
							}
							multi_step: {
								hash:       "DFMO4E6P6A6SDHFGN0SGSL95L8FB12G6O5GJ0OT9QAMOS9PRN48G===="
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
