package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "DqKEDkeAMpXYqHIoPwSqM6LdJqmL/qg7TGbZRz3OQ6Q="
								"pets.cue": "hcrRHLFD7mqW+bNCnhdzW3Y5cQyTG788MTO6wAHUf64="
								yamlFixed:  "Sj6jlNQfEaoCe53O0oleGarP91rI8ErQnzmwCg35bMA="
								yaml2:      "r2EEiHjvYjspbb4qxI8hjTYCBBxPcMfxGxYR0w68MB8="
							}
							multi_step: {
								"EBMQ255GCN3D2PQOHVJ5VS7PA3E8PC15VJU3L6SFP659QPCA4KOG====": [{
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
