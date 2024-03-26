package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "VXH1m/r8NeZWeSQqRvOe50cgwUli+1g6EtJfbYdGY4s="
								"pets.cue": "YlIyzmx1Kb60QCGZjkDHbYMdhWmUWobe8w3Ih77pGsw="
								yamlFixed:  "aqE/cM4mJBJvdg7+zmCJaPho485NrZmmDQkqsiBooe0="
								yaml2:      "gtyG7v9t7ATMd/pXJrWbDJqkBg6/Z8f2RIOvYMiu4BM="
							}
							multi_step: {
								"12URIG5418PO80SN8004FLVROSF3C8RC01JU0I9OVRP4JJEU6U70====": [{
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
