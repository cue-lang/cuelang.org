package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "EqJIRI0xD0cswpUlqSsncpB59GwZPx/T/jfoeBZxUH4="
								"x.cue":        "/mzwai81sni/InzS/0DLU0ttxwV4ZNDcNu4zlHd4MAo="
								"x.json v2":    "20nsd+kPt5a5s87FLIAmhaSdgCBpdChSBGAsba/txPk="
								"fixed x.json": "XiEmVzhsghVpNwbW07uQ939KHL7iilsuZhIEcc3B8W4="
							}
							multi_step: {
								hash:       "U6S7PINBBADHI6UM87096KP4DLHARFIE1P0LRBRQCKGMUTSTIS90===="
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
