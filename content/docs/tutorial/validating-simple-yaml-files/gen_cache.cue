package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "m7zVgvWxYjUfaRHBeqXTGbYk2LwEHoqzISDFJnFOLz4="
								"pets.cue": "lyE/EI2k77hPafyTTxhuIyWGqW+QILyYXWn4Kn2yCFw="
								yamlFixed:  "I3SJ2PVU05XFEzboMfZi8XSVfYKjIJygyfc4lPGP3Gk="
								yaml2:      "FSpb4TrvYSyY0ST/YALwJzMxglq9U8sbfOShzVDdNqQ="
							}
							multi_step: {
								"OQBSFKO5FUV70ILCC3UVC5707DJ54CV8DUK1GRRAA6J7FF8NTS0G====": [{
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
