package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "OKlcswxEX2e3wVIXAzZeOW8XTsz6QWThbOj8651z32Q="
								"pets.cue": "DaJ9UGhRD1mt2NzOJpLfL12pSYFrYSbOPitEmFSyZrM="
								yamlFixed:  "wpRqVmlJn6yiqu/ZP5Pr8CdfHepXOhuPK522LRLsMOY="
								yaml2:      "nrqRU8FSRvmByWBJiNUGs5euU4oAcWZoi9/xlmB8ky8="
							}
							multi_step: {
								hash:       "TTOSU87RJJMVER4S6ALSSIMEAEFTV54O4RN5KOK6B3SL8AK20JPG===="
								scriptHash: "E9D52RTMSNFNMI4AEOBJ76MRM5PFKS6V6LEPQ3VG98NMGBKHOLQG===="
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
