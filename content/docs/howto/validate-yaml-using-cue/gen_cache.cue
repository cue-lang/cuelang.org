package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "6Y036w/idPEfkULFAUAgThdMVQlb0m57/0joZiSkQgw="
								"initial x.cue":  "Ds20wJVgCpjikcOIHdluIlaQUy1xYwR9qP70KcS4IZk="
								"another person": "8SK8bFLMm3HDoX7dobC2ZpeaaS8HWQJAtV8O5J4FHiI="
								"fixed yaml":     "oIawzkJZ2KYFUTdXH2xqc+gaIukRwIOxwdwqyHZzCM8="
							}
							multi_step: {
								"IBPUL6FE6VCPKOBDJ3UB234LE00GMD2R03FMSJ7IAODUR9KKL8VG====": [{
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
