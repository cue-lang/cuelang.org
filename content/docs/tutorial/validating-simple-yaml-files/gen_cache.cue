package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "faytTpAl+sKZPu59lFUkr4RLbpk+Uj+1k4aHhibCq8Y="
								"pets.cue": "2znpnx1abIOWr0eVIiLLjzlgI9jMcnZt+oCIbQ2JeMI="
								yamlFixed:  "Xm26T43nvJR9EoDFx2v1ETm9LBMGKVJu4NbpLuVL8eo="
								yaml2:      "45/wn8dOaso01BNXT0X/6VSvUt1Us8O9tWgoUvJhSDQ="
							}
							multi_step: {
								hash:       "UAN5H4R5NKI66V76SOK7G025FA5MBGVVV6BO3MCIPFQMLCJT797G===="
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
