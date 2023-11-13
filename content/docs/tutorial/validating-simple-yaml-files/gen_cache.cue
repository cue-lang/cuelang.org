package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "XOrduwV4/bdbCC5YghY7F++eFuvkW0cIEYwGBXmXd9M="
								"pets.cue": "1d3YA8JqPgJZNts1qVw3xbEvYa5goidBDK8/m/GFMxU="
								yamlFixed:  "zYA+uHmBuPdoi9Mfx0kJXzb5GCb8CevR/PbvkotH4Z4="
								yaml2:      "PfIDs4XXa1FDioPNUvlJlnRkldd+0vtAf8hirBvm5oM="
							}
							multi_step: {
								"B4IMIOD9T8ECJKSA26QEFSSKETQNKRVGJD429EH4M6SBGJ8B3LN0====": [{
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
