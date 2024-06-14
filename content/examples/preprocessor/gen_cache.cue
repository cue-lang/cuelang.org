package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "ceWgVIxgJpJsXddI8QtIyfhBe5mUmaVaGqTtyx8aGJ4="
							"file two":      "kDP8ca86qo7EwbQ27PK9O/057ldTaihB4IGFXX0IwtY="
							"a hidden file": "60lN5GX+4FeOOWSS/GXmNyHbJ8JIsmxNuqpI4ri0ywE="
						}
						code: {
							"a code example": "F70EbWVeblvN2I/K4FcTa1rKfYlxv2EsfA+8OkzKZow="
						}
						multi_step: {
							hash:       "1VN7SK9MRMPRFO1J57BUL4O341TAVIG11S983P82S8MN6AOHO1J0===="
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
