package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "9ZdzIZAc/GDJSJLz9Q5neuRUXDU0YRlt3n9KXaxLk1g="
								"pets.cue": "vvqJHSdXrzyTRhl9mZmr0qhut27SxKhdgzayX76SipM="
								yamlFixed:  "9hZ75GDihOPbDpTRHKPXRNOODD+w29aR9gBpA7Mf+/U="
								yaml2:      "8crQZH96j/KIaSeYCTSrFtwS9pTPkXZT8ETvcw07Lzo="
							}
							multi_step: {
								hash:       "HSQSBTT97DVQSVPQNHDGI5KFKFBE05DRV131OV04GENQCNVIDI3G===="
								scriptHash: "CT8B9VRADUB82ORG7R3FRB2UVANK87TJ8JQR8JAOKTIAA4J9721G===="
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
