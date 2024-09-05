package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "eW2kxDTJNy29XWahPONLti5soYTTdhvgyzovsP0DrAM="
								"initial x.cue":  "dNSy3JRP6cWXVOcZPShqxqLI40dARBE+nzwL9S9++AU="
								"another person": "xUh0xptYmOFpjpqVA57Bnrd8KLIOpKSzUE6fV4NaGcY="
								"fixed yaml":     "ZayaGASwqZ/L9Qcz8PdBbfDKNPAs604jQyer7KSMb9s="
							}
							multi_step: {
								hash:       "42R4VBN5I4RB7LKC427OGUEJRIH9G260G7S7QICIJ6UDNFR79C2G===="
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
