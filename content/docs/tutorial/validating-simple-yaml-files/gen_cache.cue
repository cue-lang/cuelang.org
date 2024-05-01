package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "q8xuVAwZJXt6I5ZSqxclGpZLaKhQSK4pGJA0H0MyOKc="
								"pets.cue": "hqxJajhQDlfJkYlfET3R/R79FlRvIQknDvgp3YfsdLI="
								yamlFixed:  "uI0HicSQdmekTj8/wuywohhFloVFovYraaioYlKw6cc="
								yaml2:      "k/XxIaU3zY/EGSds7DP4pkMnj/HpJzNw/qy4vacGMns="
							}
							multi_step: {
								hash:       "0MO17G51KEGU2JVH9GCFQGHUATU4O5F5MPPOSPSM7V3HTC79JBK0===="
								scriptHash: "KFHGS8RLBCT1H3EVIP6EUNQ77RA9IK9T6OR3F9EPV22L19BVRNEG===="
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
