package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "u02AzmZpahqXCy+y6xxHNhanMpwPBtuWaLowjG8wYyQ="
								"pets.cue": "NcQfJKaBZoBjh5v5rzz5v6q+qETHa9QellNGWS0Fs8Y="
								yamlFixed:  "5x0xBsz6AyFXVDrJNwALt0/0i/q7YwnMV9qodehdYEs="
								yaml2:      "lEVwjKHuiEE+ZIdXf1ZPIuQom8h/dqYrq0+fX7hcesg="
							}
							multi_step: {
								hash:       "RLCB75HGVLP74R7HPVLHLC68ILEOC70EKC889K04R7MQJHEHFKP0===="
								scriptHash: "1MOMUPEMJIUF8IJSK8ID9EBD3O8DR5RGTBTUH1TTS75JA25QOC00===="
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
