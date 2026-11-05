package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "uVTDsAwOnE3xKVJ+47YfZX2aqjMbMhcaLl2o31Gc4Ww="
								"x.cue":        "QFDQ4Lu2+B26uHkTgh6dz9ElZI7DUs07UR06HlJGp8w="
								"x.json v2":    "AX/OxYmnCT2YXPEeSwYFm+x4uzL6SpXp1GaQe3lUQOY="
								"fixed x.json": "UWLotAQJ6NIVXNZ6O4Ms7bpqN3J5YYLoY7TmmwUIw4M="
							}
							multi_step: {
								hash:       "KLEMFDKIMRERP1FLETNLHEV2GIV9QRJH644ND1PBSDSOO9NB60DG===="
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
