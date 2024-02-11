package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "ErqhPy7qXFjCyc6Avrn0rdqyr7TgcauBvNpLCQMyzEI="
								"pets.cue": "zpM46ffo+eTLGXPivetYFSgpQpF/lLHcFKCKPISyI/8="
								yamlFixed:  "UmYYVP3GyUNbx3J6uyPLuU+1H0fE2Dfzni6/7K0h5uc="
								yaml2:      "Nk7uef/XBAWqt8o5zSEyff2s/fXR4RUc9CGG7/rfgfg="
							}
							multi_step: {
								"9QNT094STQCQ1PT3CRU414QT737C745DA92TELSQM6LGHA8T7AN0====": [{
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
