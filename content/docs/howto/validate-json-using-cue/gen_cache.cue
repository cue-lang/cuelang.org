package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "JoYbLFm1PHKKQzhbwhal0gScV9JNvD/oV+yinucd/Ec="
								"x.cue":        "nU5F+qYpWcF/0KKuOoF6WL6TeAqfyNTxc3hQxWgvMUw="
								"x.json v2":    "tCQ09ArGtsCzygz9yC4Q9Mk365ewCWZ7UPjG+XtuJm4="
								"fixed x.json": "sLb6vTr/y7HtZOhxkeQC+AUGS+aK9uA1XgZF4b6dtAI="
							}
							multi_step: {
								hash:       "KDFEVJ4SO7MPVIP472I9N3FEUKBKP5PVC3DF0Q6IHKU8NDUUQ6J0===="
								scriptHash: "AAA3CVDQRKSCMFV7CUP90CM199MG6USVJE9DE2KGITAA48SRPHGG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:25
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
