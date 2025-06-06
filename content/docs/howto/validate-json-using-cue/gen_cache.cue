package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "PileGNJd6ecD2gZBtmaUSnwvfkGVx+A4SsDZdBbl7u8="
								"x.cue":        "DRWcth1Jmk5xAcAuAI6KFigCXXPJgYOsvqBNBq6Jkt8="
								"x.json v2":    "kWvewV5aqUswbTi9ulNIwzaQB7QSn/PaH7KCQXBPxWo="
								"fixed x.json": "ZQ0cxvbosGESp31uuJAq+vD/qLhoZpvIN9cKWpGCguc="
							}
							multi_step: {
								hash:       "KASE2D53FLHDSNKEBM22TQ2T1APFCUFLUMAKU3KH7RCMH40LCIM0===="
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
