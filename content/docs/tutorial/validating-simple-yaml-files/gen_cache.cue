package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "TXE6sgZW9HsyKjRp1uLPronRc0GyuR6OE6BAndLAmeA="
								"pets.cue": "45+HdnkH9NcyFMo7nnsjEMdqnFOW/LVBVCxBqOCvkhM="
								yamlFixed:  "aOoXMTh/knpCpJILAA9Sq4JXqHXUo0VgcoP1YJyoCws="
								yaml2:      "a+qu4EgfdubWSUSk1C5dUuj8o2AG192yk79IwIpGpNg="
							}
							multi_step: {
								"3RPTOC1IFMAILN1FDLQ3PTM6M0Q5JRF80AVOEICO0PMPN7VS45QG====": [{
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
