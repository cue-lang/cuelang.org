package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "QC76m/D3qv2bxy7wbCb3kGJ4yuMOwNnvJm69Cv1Tmhg="
								"pets.cue": "Z0azk7iokkN0E18YP4cR3bfcJjHmXziu8h4NTCXTP1E="
								yamlFixed:  "qX93jgzX4a2zoa6Tp+H8ir+g5HUIIrjuA88ouwUY3pg="
								yaml2:      "nNWtUgVg+xuwOnwhSQAiGMAKgjsRSlpDak8QmWPNpHs="
							}
							multi_step: {
								"NAOAI4VN7750K6F23DMBKL835C6UKOGHC7HO1FJ6CH102JOHDMG0====": [{
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
