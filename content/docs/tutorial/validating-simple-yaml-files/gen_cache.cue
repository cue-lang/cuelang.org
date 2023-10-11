package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "xR9ADoe8PhCVg4EmnK7H4HEL1QPDbR8ia/I67Z11Xks="
								"pets.cue": "xL3+HMEFIeFgZdz4gjhYFfP8ZSfB3J38+FQ51gFevzo="
								yamlFixed:  "CFUpXAqP33feUWdv23DSXQcX79/Zi+DxN9WakAX7TgE="
								yaml2:      "9nuqUSlRNr/tPoGSgnEwLFJMRfKhRD7Z4fI7MKABNCE="
							}
							multi_step: {
								"UL5KBO71BQ9CJGJAIH2UJ51TRJLLS7AODBKSI8ORBUBGJKRRDKBG====": [{
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
