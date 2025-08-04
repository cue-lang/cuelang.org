package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "+KI2E4IxN5SRgAwDkpuKynHIFMQn1cvveNfkCUxknhY="
								"2": "reHYVsfx2um6ZT4WaP38YiDfelTVOM3NaJr1f2FWk2E="
								"3": "PpwVa4IbmslaLxRKqRC2NmPuRnZhfSAZYVSztWQr7Ms="
								"4": "xDBR7bBve5KIh66k8VTYu7PB2CsKYhH0HoyLI0Oy0KQ="
								"5": "JwVD58M/uGa9esINBybAl+f48ARoSq8vZsCaUYI/uLc="
								"6": "bhxLNcZN5zjerEqHqLRevezFvvfIoZFPL0vMdqoWeZg="
							}
							multi_step: {
								hash:       "PBFL7EJKCEVDF66QFB289DO83LIVTH01I8SLOH8MQ2SUG3LMHMF0===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
