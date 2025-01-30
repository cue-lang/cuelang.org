package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "BZA+CBltqS1uZOq0GlnA2JLrJPrHA6W//uQSYgGDrF8="
								"initial x.cue":  "cFr1PZtNPjIpRelDE7dW/lx4CNMYBDeqq9LRc5RWl6Y="
								"another person": "n8RGTih6oXVhkb8IEeyYH0rXQIn7IPPeNdPAK6Y/9tc="
								"fixed yaml":     "KMH0qkkVUp5B7y89xrRyZWi4qYcTp9U1Oc/1b1vmwaU="
							}
							multi_step: {
								hash:       "AMDJ37FHVNQRTG99RHBT8A5FMK6AM3EQCKQIVNG9II0K49M9MH1G===="
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
