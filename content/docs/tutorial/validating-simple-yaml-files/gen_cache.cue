package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "tJPx5V5lYw3Nlbm7TNiK9/YhW3JL+vjtvgpiMNoV8Xs="
								"pets.cue": "tkiO6+GFn9r+WR3sQLdOh3qZCxADbDCB48kUG7ciz+0="
								yamlFixed:  "74A/kItlwsfKaytknGWHGlZttILwnjsHu5htnLvyNlc="
								yaml2:      "JtshBOgCgLI0EsVuR1zMWFs4RZfo39WZQtlw+PFI1Fg="
							}
							multi_step: {
								"0NT82FUE2P5VSP4CO1N378HOI8U64U3F8PKGR4IKAHO3RK2J50U0====": [{
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
