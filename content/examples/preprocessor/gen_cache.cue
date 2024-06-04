package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "AY/vc9fGzpq4y5xYEztlHSd9nsUBj3ODKXWrYfXF6ug="
							"file two":      "9fpTKof6lA9R8n1MFPgwl7qZvknnG9MuArTFiJg13Gk="
							"a hidden file": "Dw7Kia+K4uSZYDDQOfLyeeNcI5WILoF6opzAwIF9Hvo="
						}
						code: {
							"a code example": "aqdU91Xo7d35sMxJEfa/tIfr9FIg3Mil8x7doWSBIIM="
						}
						multi_step: {
							hash:       "9ILUM7CPRD0B69OLH0OL3H0ILL1SGIU40JAGRIN94DT74RFCTCG0===="
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
