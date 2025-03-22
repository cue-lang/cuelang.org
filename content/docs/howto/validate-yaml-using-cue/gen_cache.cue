package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "zOrOtrsFPTaceX3gN5ylRN0/GEhgvMlWbCy9Imz7LQ8="
								"initial x.cue":  "avT95fWoEnA8sFi9JRfQq6ltgqPhoyibBRZJldOEjvY="
								"another person": "i0oEttvjdVr+ySt9Qaubzo9dsjXbaH4B5aUkMJZIT1U="
								"fixed yaml":     "w0Kza/x7Mb85oK6B14OjaxF75ydtLFxy81panrq57uA="
							}
							multi_step: {
								hash:       "2EEFBVN9IURK14UBMHRNLSSSUPP3RGHE0J4MPF5CU473FFJKCS5G===="
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
