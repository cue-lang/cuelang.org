package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "lXEzfeTtWNByGHBBLY63J1YBAuk6bj2gxNpoeD8S03Y="
								"pets.cue": "D3IeB55eDSqwwS1q/DZ0GnHW/TGRHsNc7lvbAk/5WvQ="
								yamlFixed:  "rSI7q+vCYtAR35xhpcq4sERApLaXhTfIcojBq0u5VGE="
								yaml2:      "Q5gnOQ150G/1cCO7ddWDLHwOuTRS/iUW8FoJvqspGu8="
							}
							multi_step: {
								"U8FLQLRHEUFD8A3K15EOD9GSCK13ACQNRI1U6I9NRFU6M3QP0CT0====": [{
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
