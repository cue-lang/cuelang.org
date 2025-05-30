package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "WT6KC+zlJ0l0qq/yI4jTJy4zMZYBquZEVYJ1eMmUVNs="
								"x.cue":        "kTCgxTKMIBu2R2Ezp3mbxMvq0fRdYUtXx4mVzcWFjWI="
								"x.json v2":    "xiroYE55zjp92Lv3XeyyBnSBLADJRDw00cOhYvfozpY="
								"fixed x.json": "a0SXB7g/tqYOBXqkIrTbBFh1ntUJBRiyxXQvCtfbQnk="
							}
							multi_step: {
								hash:       "E95HV69A3QJ1CQHRTOCT0SMQ3EP08MHSP79ADMPAET1H4958IV7G===="
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
