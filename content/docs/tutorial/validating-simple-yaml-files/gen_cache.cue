package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "RxDzyzm7rZ+k/D7OB9cGY8f2Nbb0TIPRFcYpKNTH99U="
								"pets.cue": "qHdTVGthxKom6cfuAharbttouUqD6i0A5wtvXh1Xei8="
								yamlFixed:  "hAPdhEfHXb0Z5sz/Xm63JxwQBXQkx1bDoFKhs/PBsa8="
								yaml2:      "rBeJYL/gtOeZ7kA2RPiD0zgTd3qyuJOTKP+HGgbppPY="
							}
							multi_step: {
								"3E4ER9UNKB9G8OVJG4QN7KVM04T6HVLPGSJVDLJITK3V8LDMFVQG====": [{
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
