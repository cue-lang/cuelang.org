package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "cyQH5ERISbVVB9YI98M+uBbEd4gwlI/C8EhvWJWWeyE="
								"pets.cue": "v7dnEAnTYineeGtMUi50IAXFGfgT9n0IGafrYh3VE6k="
								yamlFixed:  "E9I8znpJOrgq5FsIjTLN4RalSyUgeYbqm2okKZJrmnQ="
								yaml2:      "CWzW1y08jvs6YjjUI32Xtgm+CXU5LLnmDRjdZQGBMQc="
							}
							multi_step: {
								"NI39ECCIVR8DA3NQDNOELR5J5HM8FP60U7IVFJ4SHV1298HN9O3G====": [{
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
