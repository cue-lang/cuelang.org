package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "MwSKTYNqR9fds/LUPFjEF/OnTHcncqRJuIjJcqK3Nnk="
								"x.cue":        "LTqSGrct3XRC3PwCUmFQYrtnMtk+5NM5SHKt49YhZlo="
								"x.json v2":    "dE2nEkVW8N2uzbv0BXsEmbhHx75fM6t5ZehmEwc3Nj0="
								"fixed x.json": "yHfmBsGNMnKcAC2vy9jS1ehvGVyCWrFbvKFHXBGqCj4="
							}
							multi_step: {
								hash:       "BU58HI59B48STSBJM803MDKC1U8KFF49O1RS4UBIQGV1MA1F91OG===="
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
