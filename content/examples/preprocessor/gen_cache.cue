package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "kdS+mZ3YYNIyD+V+coREkKiNRpzCBO4m2Rgxoqoa764="
							"file two":      "62ecFhcfTtXqTrxEftYS/4fb0xWCJf/NfNJ3D7EezpU="
							"a hidden file": "knse7nSL9KYJ/jYSscNsF2bF8hoRImbK86x3u/fPRnk="
						}
						code: {
							"a code example": "yXbjgo2ut9weStypkvjm30jdQy6cCnCa+vBrUU/XioU="
						}
						multi_step: {
							hash:       "KDKGN3ATHAFHC6MB53MI8NUMKBHSO1S6R2D3R445GB4VH60VDJGG===="
							scriptHash: "E5NI97NUHDU688HAUL4HNFJ9D89OK3NMLI3HQ5QRFJ58GTDJ6GAG===="
							steps: [{
								doc:      ""
								cmd:      "cue eval"
								exitCode: 0
								output: """
										x: 1

										"""
							}, {
								doc:      ""
								cmd:      "cue eval >result.txt"
								exitCode: 0
								output:   ""
							}, {
								doc:      ""
								cmd:      "cat *.txt"
								exitCode: 0
								output: """
										y: 2
										x: 1

										"""
							}, {
								doc:      ""
								cmd:      "grep bar foo.txt"
								exitCode: 0
								output: """
										bar

										"""
							}]
						}
					}
				}
			}
		}
	}
}
