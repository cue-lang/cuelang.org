package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "hzfpRk7HM0BxULqlAAmyCmiX90PBJqHEqJpVGn8xeMI="
								"pets.cue": "1mWpdhVMM2Udyo/1pfwKQ4eu8JXjQGyDknGvwW/tTuY="
								yamlFixed:  "O2uUK+Bss09NGt30dJR4XS6WYfXCNuQDDvJPKlIwpkA="
								yaml2:      "0fYOQqn5s/ldTTYgBgLlbU0QaBtWZjB2qKwfPFyDZYc="
							}
							multi_step: {
								hash:       "V97PHHJT5OIBOJLB37HJ615FEKMTGN1I8GHMGQJUBVDP657R6PD0===="
								scriptHash: "8JNCF58Q5OJJLNAVFBOCR7GCR6OKK1V38Q3SGOLOGJ9KUM05I84G===="
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
