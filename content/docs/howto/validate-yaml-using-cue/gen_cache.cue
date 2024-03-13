package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "tkqVQA6yFAHpY69TXvFvp/g/YU2DmtjwllApjhTRsjs="
								"initial x.cue":  "PFwwqo949ubnwkSaiv/b4wOXkS4gHYKVgjSAaLJtrcs="
								"another person": "utKsu4Cd6ph43OTKSxlwt8a/PFNR6TzFhfBHnWQcu1M="
								"fixed yaml":     "M9Qef7FCy06onWDhA0LNFQwdx1rUmb/sDZUjOYCEUDE="
							}
							multi_step: {
								"B0G459FSGDO7AJ4DKHCU3OCJ9HG4D1VLP1OCAPEGPDRQKUP6C5VG====": [{
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
