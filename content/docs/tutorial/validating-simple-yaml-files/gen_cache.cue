package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "axENKZ6AO/E2jXvreBJcdqEbbzIuGZZLePeYsT86QmQ="
								"pets.cue": "+vVL8fKa+BEdLMmMeZqQ6ovfP0oTVasEDJwKei8MrvI="
								yamlFixed:  "J3dwnbBRHmMeVXpCq1uF9CyGsESoaQaL6Q0AB2Ffy8I="
								yaml2:      "uaX6TmwGKPiMRCy4TjszlLTJwnCserGc2znHHKyiYoc="
							}
							multi_step: {
								hash:       "CRBCGHUE3F5HSG2L2NV7I69Q4TQ1KU564NRQBPIDQJEGE2PCTCFG===="
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
