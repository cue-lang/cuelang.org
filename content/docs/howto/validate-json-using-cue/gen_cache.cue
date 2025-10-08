package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "t9px8tau8oFXSbUDVLMsczajpq+yg2THsgGYgCDHfqM="
								"x.cue":        "GzfmQaQD19ffIdPV9v+8e9Ef/W4TSgmBO8c3vmeIOU4="
								"x.json v2":    "paPOq5IfN9S9wsayXZ3247SCpcgqCw+wRPQeUBtxInc="
								"fixed x.json": "/5giWqzd/CBCII7scJ9Cv30RuiBjhcqyMiTyfAwM76A="
							}
							multi_step: {
								hash:       "3QOUJPAQLJILFBP6H1M1PTH9TL7FNTFA1RG1JM9N9CCEOLTMG2KG===="
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
