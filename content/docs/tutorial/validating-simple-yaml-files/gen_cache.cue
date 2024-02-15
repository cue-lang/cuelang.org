package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "gjbNwLp6kJuhIWsz+S5pn/pvlWJX3ZDw9mjoWycfDzo="
								"pets.cue": "6GCSn1hvaMtsIjzALddMFlUOU/INtSCrXHgnGRg9ck8="
								yamlFixed:  "5fuzjm1L+CL9sa9N+y+Ufxg9MVu8Fx8hhE3bVeEaQk0="
								yaml2:      "d6+jbx8CpZIap5alz9+Mupd+a6d+zIdYpZEUV/HAOWg="
							}
							multi_step: {
								"A64DP1TUGBLT6CGHS097QOVO7QBTBOJQ2BCOAH77GIBO13EFVKMG====": [{
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
