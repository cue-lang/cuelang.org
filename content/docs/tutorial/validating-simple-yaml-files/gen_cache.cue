package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "ej+F7Zlqshn/iMiAOa1QXWOmRm+LT4FDPzaLo+moC2c="
								"pets.cue": "xmowfq4shN8aHsu2AGUngdpSBnzGRoENrVn6KhsRVk8="
								yamlFixed:  "5K3b5HvTZajjFvywr9KXA/3WRhuctPUsRTtMe1Sg8Ks="
								yaml2:      "Owz8gauuKbxv6Z4mD5BillI8i+7AA1ZriRbnri/tp9A="
							}
							multi_step: {
								hash:       "8H3FD8MQA6GNNQGLEFP6JTDNVH2O2V9VREV3AD0J9TRAVSQMUHCG===="
								scriptHash: "VF34URO8GRL77FTKANIN81P7PQMQ6LRGAN8UDAS8BPIFP43O2SCG===="
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
