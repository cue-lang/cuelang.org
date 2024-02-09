package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "MiB31CLB3SMyPsThoAkAZLYL4fv3M5sh+SBP0mlM87g="
								"pets.cue": "71BpD2ApT+XdG99TkGsM7h76cJDj2EYOubsvB4+GWLI="
								yamlFixed:  "9eD68zp+T5UzA5aHIF7nvF5lD8WDkC8lD+xbFXPUQVU="
								yaml2:      "N2xhsKWs3pszRhx+e0kxm3mn7FsNpm8W3iCFONOwK7Q="
							}
							multi_step: {
								"VOUH30G2C69S0Q4B7R0EA74FJTBCF65VBGMIIVPO0EFMLQ2RIS40====": [{
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
