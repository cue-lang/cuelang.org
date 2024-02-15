package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "NV5vLdeu9gxcaM+Ro3m4u6gLirhu94adQE+BrFjPktM="
								"pets.cue": "dkGD4XJ62tdU3RAQ8Qqjwr1Myl1ZbPHpTKUesgG/qwM="
								yamlFixed:  "TAXt0nld7IwrYahcGNHGYDQgwmtMWRcirWRMbSMO39w="
								yaml2:      "zQHZqbHfpvsnkntIPh9mh7WVUa7HUYKohgomCTlQXDo="
							}
							multi_step: {
								"4QSMKOANEFEM1I4KTH3J56GMF7T2MHMOPDN0AEKSGR1TM88KQO3G====": [{
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
