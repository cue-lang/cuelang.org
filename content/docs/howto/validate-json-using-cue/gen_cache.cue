package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "c3L71MaIEd/O30GILCEKby20adfYyldova0/apofqi4="
								"x.cue":        "mX3XNWn3ZQRfmC2LOWx+6EwbH0glMov7oLZgouKB6os="
								"x.json v2":    "O5i1w4kYZ95mDJNWtpnzqPGVjbSYKpHtyUdR80fN0Mc="
								"fixed x.json": "z4+zdP+wxvkgUy0+2K9vxWMCnseIy/KQv/1hXaRRN0Y="
							}
							multi_step: {
								hash:       "A49RAVRRFI3F0DJA9887INTI3HV8G23S739NRP15CIQN28Q8E2OG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
