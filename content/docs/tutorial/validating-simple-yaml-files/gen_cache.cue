package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "UqVTijO79zatAr6IqyYzn/dcNqqHkELUrAs5ukxNGeM="
								"pets.cue": "ZKRImEhabh6Irk7pQ8ewq8yaxflmtUfwmIEvEYRKHVk="
								yamlFixed:  "/5Y10vdyNlr0m7EPhEjO/OByWXuLtG1Wpy4Rb9SR2xs="
								yaml2:      "t5WKljuVvOrvFjptjXE48oanEu6LvrbPvwMG+gjbSH8="
							}
							multi_step: {
								hash:       "CNKI598EUD4R19JOA646BL1CT94TMN7RH66KLNMNRH7RAFIIM10G===="
								scriptHash: "KFHGS8RLBCT1H3EVIP6EUNQ77RA9IK9T6OR3F9EPV22L19BVRNEG===="
								steps: [{
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
