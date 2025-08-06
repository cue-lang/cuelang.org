package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "uUQxwA8w9ENTkT8hXEhfSxnN+w62+hoOdQTt49FWeeM="
								"initial x.cue":  "TYg9TgDCkiRFkssRlENj0xvr+KGNuw/UgM0190iiDWA="
								"another person": "Qtg4sUSaQWxE6hPOdbHSMlOtU7zoXWzSZwguIXBE/68="
								"fixed yaml":     "17ne76QC8rEgyymtuKBGmNyWWtidXBcSVjfN1IaB+UE="
							}
							multi_step: {
								hash:       "D00RN68TQ4R05FPKITRJ5544EVBFGAO9SHKTSF36RN0H53UAMO5G===="
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
