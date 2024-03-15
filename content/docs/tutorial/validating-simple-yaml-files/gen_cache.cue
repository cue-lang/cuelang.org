package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "RCDrFja4EC816D5FQ3TUCrQ5BpIVBrPgJpTMVhJW1L8="
								"pets.cue": "u3//CxmITu8JvHTmjA9OesLPgg1tSYVl/yOiYbjVtCQ="
								yamlFixed:  "vIi2wgA4CzbteQG+9NsMgSVMlRHEjjv+EaiDFqrQ4Ts="
								yaml2:      "PEBCbtlJOuQpGCECyJr1+4nFEul3PVMofn4ZkKdvbPw="
							}
							multi_step: {
								"9Q7L0MVNT4R2AVRNBDG1QPATKA3EBKOM7E263E6CP3HR3JFIKEL0====": [{
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
