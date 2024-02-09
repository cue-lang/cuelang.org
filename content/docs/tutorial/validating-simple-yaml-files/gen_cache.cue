package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "tQaItyCX2RDrvrT5vlxmqLUwlQm/yQKaucbndiHnw5A="
								"pets.cue": "l1GjJFBhjy+DQZCjBiFVgG9QTlalkMccuqDRGaWZ7IU="
								yamlFixed:  "+3PCH2+z2/V1qR0ZzuUotlAv1DaGXj2cv31fCGkOOw4="
								yaml2:      "9UsWpynh5y8oAziyVSWYNlJtC9YTh4p4/czFu3dFMgE="
							}
							multi_step: {
								"BQ3DUFPRNJPRF8C0M0P0RM204SAI14T6778KD3AREAFGEPDVI0N0====": [{
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
