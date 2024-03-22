package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "Ip8Lc+HLGrDraP13FgQGWurK/Iz5ZYURcu60wOVMt4I="
								"pets.cue": "4HdbCEzMKTXiXFxVDc16IUAIXL9XuGlYVYGa9ILJQTw="
								yamlFixed:  "mBzfCgPW3O7mJ5ldpZ5nqUEvjEv0JHYSfuPw5F+1xrA="
								yaml2:      "ti/3+7y4x4Myxgc+1/LQ4RZQuT12lF5Jc9EokwaZGJI="
							}
							multi_step: {
								"Q92QEBUS2AF43G65KJKBK031JF857CLQ3Q8IKDLBGSGV04RARRMG====": [{
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
