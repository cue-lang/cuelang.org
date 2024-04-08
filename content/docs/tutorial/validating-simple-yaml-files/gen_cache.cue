package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "GvarvyniDzE8yOFdTlBPvuaaHMx6tEEuTgUPSkBvgAM="
								"pets.cue": "KE0U1zfAmaPU1qAKxvJDe77zvHlRcx8u06LtNR+bLPk="
								yamlFixed:  "h1SQXcioFp/365X7NtOEfVwNG5d6EAjJKyOBmJ/KiFc="
								yaml2:      "WnzJh1x8/r/4IlTRMHzZTj1cfVbvlF0EiPJ246ZOrcc="
							}
							multi_step: {
								hash:       "O9AO017IGDL7NUQDNMVB30J9N8LSD16CQITBF759TQ1KENFM98RG===="
								scriptHash: "1MOMUPEMJIUF8IJSK8ID9EBD3O8DR5RGTBTUH1TTS75JA25QOC00===="
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
