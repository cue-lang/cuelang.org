package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "olriVh6Z3zzbgD719zsq6fZBNDWbtmkaRDiwMA7PSmo="
								"pets.cue": "S3ApHV8OsAkQRPTXoEmgQAKhc5F882V3mofUIbKPGeQ="
								yamlFixed:  "WScPz1WsL0Snqf61RP5Yh1RleUoenvoNoJSs9z/gS+8="
								yaml2:      "HnY4F/wOuyvC6y7KigA2GLCM2TewvGGt+Nrwc+ErciI="
							}
							multi_step: {
								"T6BAUASNLVSS397JIC5O49HDKBG3P2V3QPTL3DTA2UGD7JDLT3F0====": [{
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
