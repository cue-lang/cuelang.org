package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "pAljpU3FszrklZl3zNliktGCd5zCaqu6RzYEIanDxsw="
							}
							multi_step: {
								hash:       "6CR38R5EAHJEC55KKC7V93G2G6LKV3GCC3TP7IER967Q4D0MVC10===="
								scriptHash: "TAEGI3SPL5QHNIICKHHI4OE6PDB0VD8VH1JO566NGSVKT8UJN020===="
								steps: [{
									doc:      ""
									cmd:      "export CUE_STATS_FILE=stats.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet someFile.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat stats.cue"
									exitCode: 0
									output: """
											CUE: {
											\tUnifications: 4
											\tDisjuncts:    4
											\tConjuncts:    4
											\tFreed:        4
											\tReused:       2
											\tAllocs:       2
											\tRetained:     0
											}
											Go: {
											\tAllocBytes:   4461144
											\tAllocObjects: 49719
											}

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
