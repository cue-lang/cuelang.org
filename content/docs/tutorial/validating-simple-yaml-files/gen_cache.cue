package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "DRK5+AicOBnS0sa6hIrbGlkAnBh3AP58yGzvlzjN5lQ="
								"pets.cue": "vd52jjo6cbmA32/fbNY0tmy2MRZUCv/njQSOGg7MOJs="
								yamlFixed:  "N4dwmkhcTpy1YC5J+Genty9toz9uA7rsy2k9VdpG3m0="
								yaml2:      "d3sCWsPQ0/lMTL+JwmdaBwe8cOvKvnfAWTMoLperw18="
							}
							multi_step: {
								"5IUM9VEKO8IDGA2J1RCUARR9GN268NORJ7IKGVRL8BGOHRVDF6AG====": [{
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
