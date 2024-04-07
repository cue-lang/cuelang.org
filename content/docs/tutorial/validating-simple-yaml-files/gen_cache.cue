package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "4t5WMEiwS2LCm8MhWrzSOWJyV2e/8SwaISm1GcJX1og="
								"pets.cue": "U9rao0W+XWZs/wlc36XHALu3FEsY8BUwmPYGX5A/F+c="
								yamlFixed:  "VVN1z5EBbtVh9QXuVr3zwzXqzeFAiaXAJVOBIrtvUfE="
								yaml2:      "WckykfjV0E/U0N9TopcE3+3uJbkDCvFM+lOiLNU/LPc="
							}
							multi_step: {
								"2N69OJ9A9K5DCNBV6FH2CB6JOE9GMF2GI54GE0IHE8MRLFDPO0BG====": [{
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
