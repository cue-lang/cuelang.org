package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "l/wAykDjY8Ic/dmrs/K9vz5mnHxc01iCHZusFy8fOMc="
								"pets.cue": "CIljWJJuWskh/kNADM4sBjvHpd/JQMw8J6IRY7JDXjk="
								yamlFixed:  "5/dyjhp8Bg6OFA3SKy+QONKSsFd2Q/xQawSYyRAxVlo="
								yaml2:      "ki1S+3VR0XwC3mqul4VJbLzdqvIoLP1D2cRiKc1Jn/U="
							}
							multi_step: {
								"1RSROCHG2VO87MJ7H5NSK2SNDJSECH0J5JUMFUBD55I9HJK05A90====": [{
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
