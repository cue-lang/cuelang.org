package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "swWH3n1FrD9+PoX4Ti0VJ7ahla9Er24nszznzUQkR0M="
								"pets.cue": "QXw4qqgDFV2OgusemsBHj4vOE49u0u+1hkYQP0d+u7w="
								yamlFixed:  "mQe5y9uydLERE+agNR8VStIr4JIqRc8FKmfOpSMJMh0="
								yaml2:      "rgJlfruBV1A/pAJ4F/ecfQ3RVJ9cy3VHC0zFBo4fjWc="
							}
							multi_step: {
								"O96M6LOH2UEEKK3S1S6DL7VNA2QOU8MEA2OO783TD1PB7RLOA40G====": [{
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
