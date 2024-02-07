package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "ddbIZaCQ6RBm6Iih8bjJjtDI00fTTaFDASpmsDCiP2Y="
								"pets.cue": "qdpwo5HyKtDjGjNTNwwPqhiftJxIBHsIkRWAfDhNqDI="
								yamlFixed:  "wihFJ/dfmXcGgrTR6lFbDN85wrMEUuHOrf8ZfCT04bo="
								yaml2:      "M8reY/tMVwIKI+g3hzNiwJnAXUFKYDFqTZ4j9ZiS1TE="
							}
							multi_step: {
								"JNNHRFVBG37U0NCVH8OHT26G8VAR5ARAQELKTV2HSE75821JG760====": [{
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
