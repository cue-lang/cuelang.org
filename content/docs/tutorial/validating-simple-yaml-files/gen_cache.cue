package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "uz9e7JOLFuOCYaUkbSN0jB+CbAEGkXQPGAtVnLp3iBg="
								"pets.cue": "bDKVOycf/XyZGh0FJvaHDUBEpuKM/+zUU6AjZJVvOpg="
								yamlFixed:  "Gxk6+NzUjWgtPT/LrHHYDin0Buv/i/2WMmLHBlVbqLU="
								yaml2:      "8Ljw9dSK70MBHlXhSAY1Ih7ufNmFkyVj1MUsPos3ZTU="
							}
							multi_step: {
								"93KKQF8EI1ENKQ6P948M7VKFB8HS98N65K55U6QP73J65QGJM58G====": [{
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
