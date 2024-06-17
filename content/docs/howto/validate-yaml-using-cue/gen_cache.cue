package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "JvJNWHu7LYeIeA7GSHteiPcaweu9+ts/vB5lMT3Wztk="
								"initial x.cue":  "x7ymxD8xE8j6ODiZAPXjIHRLLh9Uz2kIQd4daF1RlCU="
								"another person": "NN2IRb4owV3za51Wiw/zjOQx4EtcUGgH5qeQXvYXc4Q="
								"fixed yaml":     "Ss1IlsBk9aL0A73KRlLElM7xKc1o5wcAThJAJwVcrtQ="
							}
							multi_step: {
								hash:       "U9T7V694TLGUNL7RA07DMATRD9MHCHEDN8QCUB5GOULOGQTB48E0===="
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
