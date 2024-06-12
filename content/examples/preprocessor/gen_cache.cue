package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "VvSr5zq6x2S0tkPJfLYQhiM7BblrmnUFNu+rTwc7xJo="
							"file two":      "XGhaUQnJy58YBozB2yI9QNs0UAltWwuhlKYq6th6j5o="
							"a hidden file": "HPZTA07RfE2pfXwrg3m1Qm9YdDmQDyWL6n16+yf9Jes="
						}
						code: {
							"a code example": "JXUOCB0/WlVgbgLfhepnzixfujmZxGz6oxWXqxrmpOA="
						}
						multi_step: {
							hash:       "PN3G8RHIENS6G71H8FDT49ND7UNBSFE9H961HKP4LGCMMC3B43IG===="
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
