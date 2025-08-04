package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "92lpaxUMab2Ytw7ixTAEPS+5vQ4Y29nlzzizOF61bqc="
								"x.cue":        "x2bFS8xXZ9jnx2bFWHTm2nb0mE33U7fEZ+P/AEGNTzQ="
								"x.json v2":    "VdUB+IoGhymKeUZCkXbgc9yGGaSePFQ6HPIKtj5kYWo="
								"fixed x.json": "KCHL/UIaseRjbRM2F8lDwJ+3GXD/YqU2V9XXR30j2Tg="
							}
							multi_step: {
								hash:       "MQNA4N05IRO097ED6DS107O5O9N4HEP4BUJOGV4A4KK8PP2A2EB0===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
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
