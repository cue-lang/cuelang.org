package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "CIyjJSmAZXjtxbwC+S9aX+jAjsg38Uk+l7GaPLgvkfs="
								"pets.cue": "nway3sq/0iWjbh4FG18ZD3ouVEpYQhngDDgyZ/+BxA8="
								yamlFixed:  "NPWKP2Uy+21JuswZgZH/jyuVoG9/q4QbSQi1Rb3FNO0="
								yaml2:      "bw+8kykqnJHoH2Vs0O2coTgnSwekfOvwqyAL67xlUOw="
							}
							multi_step: {
								"SQUTV4TSLN674JVG2NBR49ESVG9P9IQNG4PMGAJLNUGDUFQIICPG====": [{
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
