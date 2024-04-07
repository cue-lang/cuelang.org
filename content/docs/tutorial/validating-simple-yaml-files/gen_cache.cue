package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "Z3OAvdppQLzNepzdzWZp1tHtx8UMkbstnLxlxqysrdo="
								"pets.cue": "XS8bD+r7VBCThfU92fRlbjvqI3947bjlUiWO7ihxyso="
								yamlFixed:  "K9gEwV5tJ4NYj5hPpQOVmyIy+DnK5vKVFoBqDjzPVdA="
								yaml2:      "P6P67rOeREEqfRlGWAE6Ky2HUXmyJwhItB1h9seJtfA="
							}
							multi_step: {
								"MQJQ6EGJC5UEOP6TQH59FSSU29GNIP2BDLHUVORSSLOJD9IJ5UUG====": [{
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
