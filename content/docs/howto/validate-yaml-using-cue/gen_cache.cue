package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "w+0SXLmwYMNt91f0wMpna3NKBlYHd+WIpA4mFevAOp4="
								"initial x.cue":  "RLsjKlS9Hnsc4DpPWmUEOj2sg89GX5Pm6YvPI9vt17s="
								"another person": "vkRDvoec+9+wQm4HqmNLWVhwlJ8sAotrBZzssWhekFs="
								"fixed yaml":     "HIeHj7lbpXKLxcmEo1bKthy/CV2j1XYmmDzwGiA6MOY="
							}
							multi_step: {
								hash:       "4F3SQHLJT4IEGA9LR2R5S7VGHE29VPQSR35CV1G0R6C5340R9O0G===="
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
