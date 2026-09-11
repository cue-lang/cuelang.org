package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "JFPuV7D21AWTB9DvC0N7rxqfIitckYxZFA8Yp+QII1Y="
								"pets.cue": "IC0j8aEIekdLdIJspFgWXM8Y64JBbAspvsWRFZ+5k/Y="
								yamlFixed:  "8vApcD4RD+q1fL4MSKW5QWx6n2FVpeVcVFa/3ASw/7Y="
								yaml2:      "o4Gs/D+zeeq2nf/rJ4ukqneqj87TjEJHm/ifpTSdnS4="
							}
							multi_step: {
								hash:       "IBFQ39INL63DAQ477BARQHKN570ATD2GEA1362O21JJE2KGE1TK0===="
								scriptHash: "1E9PKU732954L3NDO39VSV45AFEOJLKHIDRR2D3QBEIE988955M0===="
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
									cmd:      "cue vet -c pets.cue charlie.yml"
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
									cmd:      "cue vet -c pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c pets.cue charlie.yml toby.yml"
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
