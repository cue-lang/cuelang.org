package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "ulIoiv7RaBF/3YqCLIyuP8Q19BFfp4OJpMp7Z935Fec="
								"pets.cue": "8ZX9kWx83a0V6obeAw4EPk6mQZ6E49Of1D6SxK+2EhE="
								yamlFixed:  "AXnRYFb5TKGC0eOhHkeH6GR6KymK5Z9JMpImNgp+zT4="
								yaml2:      "u/By79dN6UgU6Qc2ehxa0RrKTaSYk5NyVgWxOziXs0U="
							}
							multi_step: {
								"EOE7U964HKBQQDHQN3NBS18ATL6RUNIV4N01IVA2HDVKG4UPK150====": [{
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
