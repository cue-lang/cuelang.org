package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "n3M3EZGO1jr66xdk1hjT5IBERnRQZTnb1qywnPDlDUQ="
							}
							multi_step: {
								hash:       "EE2546RDAKAJLADLHF6VLL4CJ6GK02LGB0D59EO7FP4MR464G390===="
								scriptHash: "H32HT1IOKP19JHS8HDBLNV00ED6AAUJQ170GRGOP7JT6QKSTSIO0===="
								steps: [{
									doc:      ""
									cmd:      "export CUE_STATS_FILE=stats.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c someFile.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat stats.cue"
									exitCode: 0
									output: """
											CUE: {
											\tEvalVersion:  3
											\tUnifications: 4
											\tDisjuncts:    0
											\tConjuncts:    4
											\tCloseIDElems: 0
											\tNumCloseIDs:  0
											\tFreed:        0
											\tReused:       0
											\tAllocs:       4
											\tRetained:     0
											}
											Go: {
											\tAllocBytes:   1697648
											\tAllocObjects: 12722
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
