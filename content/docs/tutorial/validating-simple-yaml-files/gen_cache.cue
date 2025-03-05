package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "X9ZzkdSUazvm3HKTWfeq6RAv6LtYYV696CavLZNp22o="
								"pets.cue": "uBs4/Djq+XykZmQ2kySQjeLPOhmxUlpJKr5n2S5nAF8="
								yamlFixed:  "jgBzMwARIj3N8TlnjWv8raMhH08AMXmhn3ET3uZcfsM="
								yaml2:      "omzFe3WQxzHWPNBn+j6IldmExWl+vcI2z7chSRVCtHY="
							}
							multi_step: {
								hash:       "E0UJS5596DNNV18IM6NSKPM6RCLK9KLB0GF2G6O3E37GKD464ML0===="
								scriptHash: "CT8B9VRADUB82ORG7R3FRB2UVANK87TJ8JQR8JAOKTIAA4J9721G===="
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
