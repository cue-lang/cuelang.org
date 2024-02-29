package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "XCSwQoxdyOM95Rh69Q7kLCVUUdSAfzB5LtLlZhR3e9I="
								"pets.cue": "Ikr2KoVVA7dpS5dA+QudRkIZsl4xf9FNS+lFOF3NktQ="
								yamlFixed:  "+UurOriRxZfUc+3ejM+V4WU30OUJDWbiLpgVjviF8AA="
								yaml2:      "X187ujX7G3CKCynyZo/l+idOTKbmCrBYrfGbbsrQ0CI="
							}
							multi_step: {
								"H0U3ECF4PG4OMSKH6VE9M98NLLRA8SBEK2PQ7U07KF7UL7A8TR30====": [{
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
