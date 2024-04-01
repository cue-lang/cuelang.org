package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "fQ/iq4S9x2J4jsqqyTPmfgU8RHg/xHYci3/01KhH/tA="
								"pets.cue": "04TvZYAjVQJzBBKR9ejL/G9rmACgxujrPrGo/VHpJKk="
								yamlFixed:  "f/EU+RI9/9d3eY9JUPv4hOViil2KZoes4iNC6qLUEQ0="
								yaml2:      "UTeDNZxpWbKgdnX/+4CHg5pRpsVsyVKKsIe+uXTpQHo="
							}
							multi_step: {
								"JJC4M5CQ0R5RG6D7PVD8AE5HER9KE57N4O1MDOA8G2H89SO2V2BG====": [{
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
