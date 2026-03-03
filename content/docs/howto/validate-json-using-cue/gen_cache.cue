package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "RSZL06gGe12wycARh3gGxrjggtat/glEj8vdK6Y9K1U="
								"x.cue":        "zRK/SFYi0Fe7S4CsWHNwqSONocZnkHLz/OqGR09vrQk="
								"x.json v2":    "Ei5z/+wg6WSU+HQJeg5LDDLHqNFhaLRddx30+Mih+Lg="
								"fixed x.json": "5XthnLySTc5Ix+ZUnnPFVxXBk5Fp7vf4VX1Ky32du8E="
							}
							multi_step: {
								hash:       "UMVPSC3DABRDTRR8DTR1D9DUP517RK6VUEG7FS4M2LNDBLJUMKC0===="
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
