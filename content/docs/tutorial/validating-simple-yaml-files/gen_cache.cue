package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "nMLjx9iiW+SqsY3xFCypFx+MqeidFSW/bpUzvojewxo="
								"pets.cue": "o839rfeT7dBy/Ffo271XPH5p0tRK8Wp/uWZOiXn/q0g="
								yamlFixed:  "Wi+QayBjbbzFAQM8q/D8hEcwqnmy67O4Y4/7AfbKcAM="
								yaml2:      "0QKum+YRmfHlYEE/F3M2fHJMMP8IruIpSLGQdmicWAA="
							}
							multi_step: {
								"8Q79SSR52MHFJBKKKTGUCONV67RH5K1JS5LIQ6OCQ5GQTMQE8GAG====": [{
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
