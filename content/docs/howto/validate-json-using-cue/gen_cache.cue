package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ynYjjL7O+pUc7Jxx0NsMJwuJYWvi1hhU/ifVUhiqBWU="
								"x.cue":        "gtiOkw26PwmopxAjy6BhE4+dmT9XFZ41hNShChzw0JY="
								"x.json v2":    "DLTnODYxhqtLDzJ9bqAC8xTeY2lSBv7OPyn9KUSuJKo="
								"fixed x.json": "ccdbH6eWx1yg6mwz4vyZ0MgeWDCCj+gu7X82z4d23LI="
							}
							multi_step: {
								hash:       "P2IA273HP34NH3EQRKCISFH99DQCH1DT5D953Q8D3L4HSC81G8C0===="
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
