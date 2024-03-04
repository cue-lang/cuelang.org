package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "QTP74Q6EVS7ORUfRkv+h3loX0nKHMppmD/ZPxN9zpiE="
								"pets.cue": "mjkj/k5Ctoq6v17AQbw3e06a6Cu2YCymUpWufhFq3u8="
								yamlFixed:  "aa7SfTrpW7aCt7G00x1AU2RbqdglepRvOwHa146KYD0="
								yaml2:      "ZQsquKBbz5osjY94AHAjZDxYu/AH5czHqfjMzCKZxeQ="
							}
							multi_step: {
								"OLEBT148I0QT9GOHCDJGRNHA9DD5EDCKU2VJFKBDHAROIN2GB380====": [{
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
