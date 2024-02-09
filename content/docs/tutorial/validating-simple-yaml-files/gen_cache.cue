package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "stDM1dXnxzNP5acv7GaVCMN7cbzqy6FdDGemSVhp75k="
								"pets.cue": "Xub3UWUUe4XAd6utNhC7wBP5jTLjP9qtXZVqayi27PI="
								yamlFixed:  "bbY1pbFEtXMnQI25B+9NeF/rFtS9GGXpZEtKknmURE0="
								yaml2:      "qzfXz+T9Cu1zwRNksj/y7h8Dmin96O3a0hTw8qXIkiQ="
							}
							multi_step: {
								"1BCR5ULUKMNA8UFPPVP9KAEHG6MKVODQFFB0DTE4DDFT8019MRJG====": [{
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
