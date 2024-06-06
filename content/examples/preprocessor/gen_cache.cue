package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "68m1gT6KqCtVdr8ctLqjYDv1Q1r7sntUNTiRTx8a/ns="
							"file two":      "jTkI8czouXffitaUSsHU9SsuHhLflj7XvgfZ7wscuUA="
							"a hidden file": "Ulr8JBaryXRZ/TAUCAZt5soGcjfUhiKxF2IO4DBfsEU="
						}
						code: {
							"a code example": "VdGMd7EjwHNYuqUOVqISfhkvcvDm1klh5gEEruBx6hY="
						}
						multi_step: {
							hash:       "51IKJ6F4UHHO8JAHIA71UPP72HFN2H6A433IGN3EF9FGMO7DNP3G===="
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
