package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "6Ptx0n67GdXolweqom6R6QITZ4OoRWFfSRqHnX6iqWc="
								"pets.cue": "ku8LJUyj6ayIGxqGHegN0sMEckU+u/IgH/t5a8BCh2o="
								yamlFixed:  "YZvluQHGHQmTJ+ZT0G/qKBkmeD16fPqR/v9rWXpa7L8="
								yaml2:      "hq3vi09aKwcz/rWyKi6sseK3mShPg6qUBO+lm1HpBIE="
							}
							multi_step: {
								hash:       "KETITQF9G1VVA5LBIAG7T9GTINUNB4OGKQ7PFL33IC9TRP9HNRAG===="
								scriptHash: "CT8B9VRADUB82ORG7R3FRB2UVANK87TJ8JQR8JAOKTIAA4J9721G===="
								steps: [{
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
