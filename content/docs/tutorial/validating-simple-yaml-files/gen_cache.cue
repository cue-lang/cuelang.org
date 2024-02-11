package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "4tQuVn6zNeNCbl2aT3HlqrrGYGPk53Ib4X5bWDZPhuo="
								"pets.cue": "8CI8PP+nSXffxZ0RMRvZLRINAyhGPBObc0OOs/ipAIk="
								yamlFixed:  "PjKGTTG3BfsW1u1iLPy2zxBU8PJQPDqKrAV4gnZzObo="
								yaml2:      "fx+1obcTpEjBYS+eGfDFfOAQKSq3MzF1X/CfK12yPKk="
							}
							multi_step: {
								"KU39BNUFKOL95OAPQSI2IMAIP6VUBRSSH284GT09BL41A7VVAE2G====": [{
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
