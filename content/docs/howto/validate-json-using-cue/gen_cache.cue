package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "bhsuh5Msxb1QlfAE5IXr3NTloBNl7HedBomk6MI2zJE="
								"x.cue":        "PamPm+sfrkcoRh1R6X5lwjOx+sky8We6uJIOMdVrARM="
								"x.json v2":    "1j1D5iPwRvXNy33aV03HrJt9YQEYzoToiPEBkNcTID0="
								"fixed x.json": "R8hk+ivtfaMOXFBUzYSpO29AvEsh/LsYMXY/1cu10gk="
							}
							multi_step: {
								hash:       "UQ3L2DUG4FE3U6GA4PPN3V7JUU0KS9QPC8F3BKFLE821M38HTKDG===="
								scriptHash: "TSK0AHJP6EQTEE5K3ON49LP8SMSD10449MAOD1RJA91HOUOLHLDG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
