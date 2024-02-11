package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "Szacq0FNQzdtbogE++Jacz5NMMD6Owzs514860WUZeg="
								"pets.cue": "wHK8XDJnksp3Ia5H2u5vKwP13xGCCW1k7HvR94go03g="
								yamlFixed:  "aW2UnzEGNmp2Jr+yaEC9SSTD1QStr4jTJ7b6c4ToDkY="
								yaml2:      "2qy/A+XtGLpYr6gaWoNJTTRMJA/Fctb15GZ+9mQjCtw="
							}
							multi_step: {
								"NI0LETTSJQ1MKJOU7LN0UVJIHF94F1220UKLT5OGSU471HS9JBMG====": [{
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
