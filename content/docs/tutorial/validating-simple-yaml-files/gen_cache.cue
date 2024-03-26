package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "gLXyj1gws62srySB/RZ85BAi8SRx60fLCeLJ4xmxkI8="
								"pets.cue": "sH29Tk5hMmccO1XMhyxSeB0wToOrTMMmGF7JfuTS9Eg="
								yamlFixed:  "WkXJeOzoro1uXq1nYsYwh9IrELFccdQFFoFAI0mZ7LM="
								yaml2:      "1MRi5ipFMqJYGhrmS5tWm3ffk8PUvKxF0XffBf6A+QQ="
							}
							multi_step: {
								"V9DN2NVDOSQDFCU40I33JKG8K3ABHQVPG1JQPET2A8V8M2VN4TI0====": [{
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
