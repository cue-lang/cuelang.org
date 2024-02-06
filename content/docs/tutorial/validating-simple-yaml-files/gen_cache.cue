package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "Ru1XVG/mp53FitE+u6A40H8aBcC2iY8uJnEbnmpwv9M="
								"pets.cue": "/Lk/rns4R/9vbpp+CPn4Gehv1oT3pajNAACp6kU4c40="
								yamlFixed:  "39o6p8GwUnusvUF75RP7FTBdBhILKtPcElfOhI6cVoU="
								yaml2:      "EOCvvAsPWEJj5F1pYaa/Cqqvhog+2LW42f3Ft/PufX0="
							}
							multi_step: {
								"DK0FCIEH9B86A0DN4EJBMNFLSHLUH759CB5JC9IQBVCPGV4T6LD0====": [{
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
