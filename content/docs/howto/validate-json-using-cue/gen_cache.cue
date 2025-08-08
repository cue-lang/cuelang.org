package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "NqASHORC4hYj2d1RLa4pbyByxpJw3qLtsyX465QEqt4="
								"x.cue":        "Genyz5wEy1YNFztA8OpxQH/5BpeTrEfvvHJEkW+CjOk="
								"x.json v2":    "0N6yb10k6Cxw+XHG1U1WXdoByJTsjBUeWmFEy87q1f0="
								"fixed x.json": "h37YF2nZJUAYNiPPc2UtDmr4XdhYsrXF6aHJD7A7Zbk="
							}
							multi_step: {
								hash:       "UP4MLSBQSGQJQQGQ6F9P9C5TQ46JCLAHEEAULUUELQ6PE7A2JDLG===="
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
											    ./x.cue:7:21
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
