package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "zWnCfOU33HL2ByvAjj4+MMjsWcMko/TOgIfMtFrvR+Q="
								"pets.cue": "KrsxVm1CC2BkJR2vz9oyurutpH4JRlsdFtmlX+U4wK4="
								yamlFixed:  "vEeb0NVhz/CFtJtNjPUOEg6tqQc11jgJxOMj+8bxzHM="
								yaml2:      "8EC2CidpxdifbzUi1phOkSNPtpXfl4UF/amNeU3oOXU="
							}
							multi_step: {
								"3GOAUUOOA3S2C6KCGDVJTJHCDD9L5A3P5P27IQ3475M5CU0TFL30====": [{
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
