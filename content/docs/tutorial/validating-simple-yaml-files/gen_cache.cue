package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "/5Ge6oQ5TtO6Ty4IqqyvwdunuaivvHhWKoGMFSfahIc="
								"pets.cue": "WXs5b6Bmr5VJ5i5fMGlmwap3efKsFKdmwgLV3kqxs+0="
								yamlFixed:  "qN88P84sE7NVIlZz5kRJljUdkvSinNL00DBCCApmtfw="
								yaml2:      "hSt6aavAFGU7rCaiPwcsZgVYzjKaamVTDGDYGrSGISw="
							}
							multi_step: {
								hash:       "M6DG9U2FE7B6F51K3QTGBE7OQN7R1MK0V2DMN04QU23F72GOA220===="
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
