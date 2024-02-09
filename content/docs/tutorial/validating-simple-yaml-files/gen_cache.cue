package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "ETdKwYfY4/9xCWErxPOfuwBDU5qLWJ0j4vQ4Qnfv1lk="
								"pets.cue": "JkKEbdcsvad032jRpxW/6XkY7OgXGEfzQjULtOZ63Nw="
								yamlFixed:  "qil48Ut6yjv8zSuYkUxUoj5mVsXoONoRM0OC9/DgX0s="
								yaml2:      "tHv0Po5bo8D+rhXP+6hWhNZEK8aXVsYQLAakiqnRiWk="
							}
							multi_step: {
								"8SEFS6QUBILIMIUEVI2728MM8MPELOMEM7ENGTGIDFVG8HIPJTG0====": [{
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
