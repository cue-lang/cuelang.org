package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "2PUy2AnlLexEGm0xlqLMOx6iuMfURvgbvWrOXvd8wY8="
								"pets.cue": "B0u0bBc5CWPNT48QTqWKST6AbMX9cPVsQcE25iOWh5c="
								yamlFixed:  "1gRynUsh/aJ7+nCkuy7zbdv+Bq4j9s9ZsUHTVFtBiOo="
								yaml2:      "nmyCP5qATKQy6N6c4zq/oFQc2E2raio3r7XD65IKHSI="
							}
							multi_step: {
								"MN3O8T40FCRIEPSMKG5BOREA7T3HGTR3J8AG94C52G775CE5SCL0====": [{
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
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
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
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
