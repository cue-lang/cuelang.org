package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "BF6fe8morWUfXTz5RB1Tawnz28VMUc0YFsGOJagrrXs="
								"x.cue":        "3MJnSVhe1rv/4S0zfU+LmxtaSSNqky4+O2bkNQmsllE="
								"x.json v2":    "hQ2inFVbBILHJaLkl+UXOocRzOGxGp2YjCRbQRqvLMQ="
								"fixed x.json": "rcIBiVVxLLHFi47BxY+x1qKNtBO9WjdqoYftHPXbZoo="
							}
							multi_step: {
								hash:       "DI0559S7GEIOJJ7MOBMKG6V5EV6916NTHT6SCHLUIT9LDJ9ULG1G===="
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
