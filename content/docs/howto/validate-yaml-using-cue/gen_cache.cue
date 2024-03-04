package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "g1EVKPjj5oSMt8FV31/b97mMd4SgbOvhQ5FEEfVrFJU="
								"initial x.cue":  "B5W8QMxwR7BZN0GPiocWWb42vI2z19JJO0iF/50vspU="
								"another person": "HL6zXLdW4/opqKoMMK1tuSfxZDPrHrIwFcr9zQwFYNM="
								"fixed yaml":     "I07eTD8dHV9dX/4o9ChJ71ECr/EAXfoO7ia9qSyfeTU="
							}
							multi_step: {
								"IS2GG4V9PK29FA4I60II56NF7H9T39LG3LUV54BC0KH6O05E25O0====": [{
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
