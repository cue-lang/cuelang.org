package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "vMW2jJinjJzt4UQFolstUYcwq/OFBZqtU5CeEMmmGe4="
								"initial x.cue":  "z54+N1r3jI8yAGlEsew359Q2+b0rXJpnwascxpCAiZo="
								"another person": "hmHnUst3fmqrgS/nfM8ErrdZ7G4gVaF5Ou3GJ4u2lio="
								"fixed yaml":     "eGfjS8W8HUN6xJAC5ijel8FLwS4LH2Df5XauPEAL0OE="
							}
							multi_step: {
								hash:       "0EAS9EGNJ9VH03K085H4MN2J0RKNKJ9UCFIHKT0LBD3EIKV33OP0===="
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
