package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "+HFJGRnP9ZVQMEmJB6Yv72uWan2DhGqb1dtCKyBY9NA="
								"pets.cue": "C7i8UF11WFfLRcCekUYum4YDGjQP7AWW0P8FcKZkXdc="
								yamlFixed:  "CY0HV0o0kj+gIpkRmiCmzzmtdYCULSLkBEPMoT4bkTU="
								yaml2:      "ttniNsmLH7O7lCaYqxHsF84XrL50cRWXS+pkl0GwurA="
							}
							multi_step: {
								"A6HFQB33BKTF6I4MEAR4M37QV5N7VR1SBPCGFLIJ7J9U04G885B0====": [{
									doc:      ""
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									doc:      ""
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 1
									output: """
											age: conflicting values "15" and number (mismatched types string and number):
											    ./charlie.yml:5:6
											    ./pets.cue:2:11
											species: 2 errors in empty disjunction:
											species: conflicting values "cat" and "goldfish":
											    ./charlie.yml:4:10
											    ./pets.cue:1:11
											species: conflicting values "dog" and "goldfish":
											    ./charlie.yml:4:10
											    ./pets.cue:1:19

											"""
								}, {
									doc:      ""
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet pets.cue charlie.yml toby.yml"
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
