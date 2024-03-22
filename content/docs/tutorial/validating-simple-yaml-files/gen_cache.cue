package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "PRypE7jE06pIVQ9KjT8itf6w30tlG2PO+O8SZw6KB1I="
								"pets.cue": "j3glcTtElhvIsxDEGVbrieed8FzHIkjIsmc3pNsNTms="
								yamlFixed:  "Fjwa92pEge+KvekgV04IX0Ce0kGVYvIxGRmTnbi5dTg="
								yaml2:      "yJ19TIxiH5nCIb9TBFpnfEDSyE5DOnIvQqkKmRrOhc4="
							}
							multi_step: {
								"J8H6K92IGJCQIH1BNSH8HUQ47S0GBB28G3QC58S6IR03RFDEQN9G====": [{
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
