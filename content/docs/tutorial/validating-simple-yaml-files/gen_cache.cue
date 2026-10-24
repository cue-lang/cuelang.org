package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "dfOO38a/FjAjFBogsqnlC0DXeFNucKRZF+c9VNBvcVY="
								"pets.cue": "Y/pW7v1fmNwL8jPn2i0WWSUUxbD9nVzRevXyBuH6rus="
								yamlFixed:  "/fz0HguJdzo1NeNVJLPYjmN8KwT/QpEXOzhreel3HJw="
								yaml2:      "ysiyQmscHxX7cpVP/qrM8uuj/ruHLEJ/aQ2JyTQab/M="
							}
							multi_step: {
								hash:       "2PE6MJMVET5FAL4IR81S0NFJF5INST4SNM39PLU351SMIUFHM2SG===="
								scriptHash: "1E9PKU732954L3NDO39VSV45AFEOJLKHIDRR2D3QBEIE988955M0===="
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
									cmd:      "cue vet -c pets.cue charlie.yml"
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
									cmd:      "cue vet -c pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c pets.cue charlie.yml toby.yml"
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
