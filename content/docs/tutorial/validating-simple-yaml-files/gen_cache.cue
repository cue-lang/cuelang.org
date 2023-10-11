package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "g/fN96fowRv3K6nHo/bHxBp4FxCSkE0cM8bxQhdKAPE="
								"pets.cue": "h2bGdQUNaQsd8k7RflUK3I2HTxqlyRR+JQeeheFFcO4="
								yamlFixed:  "79c0b92tjUanFa2mOzUNVVl9JZgi7FX0oD1AuSTnazo="
								yaml2:      "/f2VbM/ROvCZVRsylveXC/dAqMrN9dcptLkdy+95Jeg="
							}
							multi_step: {
								"LOD29EL77OAGUQB9F4SC28TVQTFN6F160LMI7ILHK6RQVVKJI1JG====": [{
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
