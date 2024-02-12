package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "Zuh2460tFH30jOg9ubQd9tQOyg1BtC7UrR7Ektdt3HA="
								"pets.cue": "SygzZr10om6AwxMCIDyuIzuu1K2Pj7nVq3Nb6DAtv9I="
								yamlFixed:  "gEhoz1rkJa9FnLTAjjSf1SRGmqxrRIKLmiJo9ag3x3Q="
								yaml2:      "G3XZMbxMoUu8LmHfhPiZ6CdrRoUMF4Z2IpMkVdlXMKs="
							}
							multi_step: {
								"ICQEKM1J2O8DFIEG5FJIVE9UQQ669RGLARM4EUCDVE04QKMU6T5G====": [{
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
