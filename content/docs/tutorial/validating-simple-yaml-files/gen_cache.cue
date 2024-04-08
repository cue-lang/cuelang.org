package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "bMkcotn8QFqZ+H4nlge67s4oq4hdSZUQG8tjI0o8DwY="
								"pets.cue": "2OsfyhuRFmdA6fSKvhCsKN4kQZiYVtWTZLMk/iBx5s8="
								yamlFixed:  "K5rKzlgCZfZUk7g8DS7G+3iw8dAesrXyIFZE0akzHCc="
								yaml2:      "OKug3PJngoiLvIXizlfGy0nOE0m+zkoq1+97h3PpLA8="
							}
							multi_step: {
								hash:       "N4NUAR76AVLC1MU11K697RDSHFG931FDL20VI21VLQLAL2T7E7P0===="
								scriptHash: "1MOMUPEMJIUF8IJSK8ID9EBD3O8DR5RGTBTUH1TTS75JA25QOC00===="
								steps: [{
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
