package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "HaeBOw33vexX4m/o7zhw1irh3XvyDCm2x0UtYLPiYng="
								"pets.cue": "pGwRRq4/Th1/bfOgZbsJrPsPIRvP9yc0hvU9QYg4NRw="
								yamlFixed:  "TwW29jq/lO6CSj+ggziXMLwjwZd7qY712bDdjQ8uSE8="
								yaml2:      "pWBQNxOmovogWxOGyMorUutVA7MvUAtEkQdjAxkaRJ8="
							}
							multi_step: {
								"OA0SQPHG90OLPA2F27MMP026B712R45UUOJ253TM2EDHJ2O8ODMG====": [{
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
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
									cmd:      "cue vet pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
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
