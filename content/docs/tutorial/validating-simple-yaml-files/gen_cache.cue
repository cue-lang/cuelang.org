package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "jwcu5IyzLmIJHHLTTgKGkDELVuGjtCB7608fFI4OW0g="
								"pets.cue": "aBXfQHeph9LEte6NBBE6Eqy0MnjLfo3p0uDL+0MT2Sc="
								yamlFixed:  "BqKGDjgblrAtuDofjxEcCSuWJ+D0lbY6Keg+NATojyI="
								yaml2:      "qoRq7vXwowFxnC/TvCo97HzwPjoG2K4EqngaEwiaQnw="
							}
							multi_step: {
								"1ATJ7HMPAV1PQMIQLF74VONV2DIU5SPJKCCJASO397OSKVSF24V0====": [{
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
