package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "L8HYRZC1iRrw5Y25mKGmPr4M8UqQRgAkghKvH2CtXVc="
								"initial x.cue":  "WKiAH+sW8S38f5pgrYj7IIr9q1l1WbOh0awxpwNQGo4="
								"another person": "yOlH8D4u/gJWaCF880pf4f/RkgZw0uskJBOxjJftoWQ="
								"fixed yaml":     "90KS7gYXYPCEJIspRRplFnmtYH2GvH6CN1kyo7ojc1U="
							}
							multi_step: {
								hash:       "BSQ3E97FE72O2U5391IG46GBP6TVT4CJNVL1CCCCGTNOOBGAJH4G===="
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
