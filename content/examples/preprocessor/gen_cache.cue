package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "NMckvEjJo97MvHy/B6WctBXOZyn3/SMC3RUwGuYN2nA="
							"file two":      "h2Dt90CzhvjHpxddaxmr2oVFEwPV1NlZ6HQLk22uuPI="
							"a hidden file": "RKd3dP/4UcyZjnCeDO6eFSjYp5+oNb/phnvwg08BbGw="
						}
						code: {
							"a code example": "sR1hRsFWkB5fXQMKe1e2gw/HV8oTNjIeHs8jTBuxzqs="
						}
						multi_step: {
							hash:       "7HQQ38SKRE0HOLG0562N3OEO332CR4SVGLRRPKUB16QBJVP74JG0===="
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
