package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "KTshTbWfZy/9sMvxHEyR+HvaLpy9Pdco/KLyu+wICH4="
								"pets.cue": "WR6Qy7X4qaXGjqEBxjr473Jks2dZ30eIk8ZDHg0t2uc="
								yamlFixed:  "Z1kETuOxNI/Ku2tpG0d/ipcA8pPrN7hClN6tBn/5o2o="
								yaml2:      "jsHeqbaPPiyc26+cXbauTiDzoVQsZtiGAvCiort8Ml8="
							}
							multi_step: {
								"S1ORRQAMI8TT1C16B5MV43H1DCEABHIEP7CG8RP15CHSUJANSLTG====": [{
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
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
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
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
