package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "/wXpAZEz/bcqAVORBBwVSLdIgOREX0c3/FRDmEnxbn0="
								"pets.cue": "m5a8QXbwCqVkPn2BFPnJ2ZTpKPuN0BcElF194S3cSac="
								yamlFixed:  "6/gp4+8H8RCRaFNhdllvcqxGJub+/3v3Gzk6PukjsEk="
								yaml2:      "a0ZNsN3ZCQgc0b/b4FQ6NGBJ2q7dAxrtv/9NcYrkeWc="
							}
							multi_step: {
								hash:       "BCLKN6U8TKPS0OVV21TTIU0IUUQPFA2PISS4ECHQ4QLFAR8HD2BG===="
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
