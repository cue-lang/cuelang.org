package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "7wG9fm+1CEadGb6FInMPbmwumRfLqAfGrbq2K4Z0d1I="
								"pets.cue": "On1vILtOwbnpSPVBtPYY9AHNE1g+VywzWRMZWHhu/S8="
								yamlFixed:  "VTl8kfWORHaasqsMEmXcqeQhaFSHNzOQpELRXseJykY="
								yaml2:      "CCxITBqXNrPUVecmAPjVOLXDKmlphmFYiiYJbw9q+2Y="
							}
							multi_step: {
								hash:       "CIASAN3259AFRQ8B10LHOL2NTEMT76KN9POTSRC79E3BE5NFIR2G===="
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
