package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "KQJoOTFxWeL3BXRGfgJWHLMWauU8RYHpjtA1HvmRclQ="
								"x.cue":        "V5BHsml9dhUsQy1sXkx5q8hK+EknljBBhmv/TuCILjM="
								"x.json v2":    "cYqEDjm45wXm7eLyLl4RTvXlAXHMLP2HlUsvDZbIVb4="
								"fixed x.json": "AlqmDiD+PgxLGMMFfaKtCRchByYfaJtAx7ez2+BUXig="
							}
							multi_step: {
								hash:       "FVVAGVKU1II155G1C4ALSPKUT5SFHTMFD4PL6A9UAOU1LO2FP3NG===="
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
