package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "/ceBI/1uZf4Wru454d1O2v0uZmIwrZT5Rv+lL31euu4="
								"x.cue":        "E/WlrCCzY947DotC1ydBT91UliG/cE8///RyeqrAuxo="
								"x.json v2":    "uJwV/af48AJ86g0uq+WmC58hqL4r7t7MOHKwvwBTHk8="
								"fixed x.json": "0t0b70X4PsHbj8lJ0t44a/H8mHp++XocED0NwQLlmhk="
							}
							multi_step: {
								hash:       "353GGMTBLUCP9GVH9FI6FVIHCASSH2K7C6P8KVFJ5OI55KPH1I7G===="
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
