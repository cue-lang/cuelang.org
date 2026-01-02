package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "97gXm/tkStGWvA08jZOdhULY2xG/Cdb7V/zAFXs9RA0="
								"x.cue":        "5zI+Jbe6UXGBfbgnYK8RWn6FCLRlcb2O4IDBqaz1e54="
								"x.json v2":    "/Z9xN4QE8654wV2+FQxJJpZ0+jzX6GRpX9crQ5BHdmg="
								"fixed x.json": "JzzGQK4U9P8GSHiH27+rld9+lrNnhMq5yyVIRfgA8tI="
							}
							multi_step: {
								hash:       "IENA956DN63CBC0NPAMFIL25NODJP6T56L6SS54C34HRA868SNO0===="
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
