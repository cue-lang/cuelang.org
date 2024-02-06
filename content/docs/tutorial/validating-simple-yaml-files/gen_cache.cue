package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "K1/1YPwaL8NsDNqH9Du4OnAYNaGuAhpkj2IjQSIAs7k="
								"pets.cue": "GRRuHo7+0A8r99Qj12M4imYyjlGJHzlPsIVZxyRPVZs="
								yamlFixed:  "PqE1aMOIf5KX0q2x4i5mFJauzaEzR2wXNW78TNVz+98="
								yaml2:      "Z0hYpMfyWXVkf1wrmEJfvPoxi2Y/x3sp+LACjWKvfms="
							}
							multi_step: {
								"NQM4Q4R3UR0ADVH7PKN6PD6EBGQTMO4B2QF0VFEQSPJ6Q5O55A30====": [{
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
