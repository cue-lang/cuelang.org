package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "27ZLrb0aZ5mLKy1e/jxetoGYXfAMTdkdmUy4pmSXk0w="
								"pets.cue": "c1UXmzGTeNGl7DaDXDLkF7Ua+eEAJ5d1H6QVhi53m6U="
								yamlFixed:  "Jeis6+f1+UrdfFymVynFys5pc/byTehElyN56Oc/Hcc="
								yaml2:      "RCxFz+iigTIDrt0fJpPc4TQMht5tfa6B+yGCXJ3caDw="
							}
							multi_step: {
								"N70MKNCLVOD1MS35IPDDK7FIBK9VBUG560475NIKCIJK54C92JCG====": [{
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
