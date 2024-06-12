package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "A9Yy1o7/4X7CXI0cGx5QoZjbJUYVONqRv9kdsx3NTZo="
							"file two":      "+fJnpE8JoQbBp8ZVxwYzMHlCWU3TObCCabu6L1zyhgg="
							"a hidden file": "ablzgixxRibBYwMGC4+DIbdd3YlzYV9mF2U76+hxlf4="
						}
						code: {
							"a code example": "9UpCraIcMUW3lOE9kp4tC1RyL2TDRQ0utUSr9uOxfoE="
						}
						multi_step: {
							hash:       "HTNLJ3UST30TISBVCQ0CGTPA4R4BGKA5A463DVDRJ1C50GLDRDR0===="
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
