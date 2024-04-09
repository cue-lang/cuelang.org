package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "FZ/GpSDBsBs4V+M/jZaGrSYlcuv9I+yfndVrwQmtgTk="
								"pets.cue": "Xc2W3//5noAomNEgFINNVJvLhLTZHT1JgZ4Pgw/RvPM="
								yamlFixed:  "oW4GdSQbgLqikPDnTK91jFFhwgBf/ytSHeWWBwDM2y4="
								yaml2:      "twlNYUbin6Q8blzSqcDCc2zAJZ3KcHkNZdk3f+eiuuw="
							}
							multi_step: {
								hash:       "G7JEN23SN5R3T08UGDOE44B5DTLBFIQFSUKMP6KIUIB05D23D6U0===="
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
