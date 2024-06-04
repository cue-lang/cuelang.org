package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "Hztx7bJxpyCFmRWTuinYaXAniOLxt4XOriOYU/WUBko="
							"file two":      "xsJ2l+3iKfHA/rehyL6C/3csQUrpgnzSuY3wEl9Ue8E="
							"a hidden file": "I9RvQPngkxddYLYxfMbXgBfgpG07UZXZ5IzErNE5yWY="
						}
						code: {
							"a code example": "3eFYLd0MMUVeQ1Y/+FLEr077/Qy0myA4iex6sKeX27o="
						}
						multi_step: {
							hash:       "RJC7VH1C7ASFKPT2L3LPU9Q0C6GFV7753Q78SMGNGJUI619GBB00===="
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
