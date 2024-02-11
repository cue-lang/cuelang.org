package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "3uiyPpqRoVZC45E/+o65X4UQH7tnAeRpnJzmbwEgLxg="
								"pets.cue": "vlmXhGZ81TDZE7TzQuI2wjKnCP3wkRGx1BM/O3uGBLw="
								yamlFixed:  "YkeDNG8DGg/AdH758IVgsIuEH4EbTm3zP4OdhgFWpgA="
								yaml2:      "xzokWJh/jzaYoLweVIr7rD1SaPRBiLMsj3i4/h/bwOs="
							}
							multi_step: {
								"Q7M41KM0L24M4N4E71OA7PRAE25MRN1MMOH5TS7PGK7ASUQERVN0====": [{
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
