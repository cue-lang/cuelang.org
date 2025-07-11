package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "l+rKU5NIGz6WfjLyuswU8mqUcst897RRw3PtE2FK4Q0="
							}
							multi_step: {
								hash:       "H0EGLIPTTQG6E1MDQ7T5Q001M4EVA1LT3KKF6L876J2B8N1HO8T0===="
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
											\tEvalVersion:   3
											\tUnifications:  4
											\tDisjuncts:     0
											\tNotifications: 0
											\tConjuncts:     4
											\tCloseIDElems:  0
											\tNumCloseIDs:   0
											\tFreed:         4
											\tReused:        0
											\tAllocs:        4
											\tRetained:      0
											}
											Go: {
											\tAllocBytes:   1361472
											\tAllocObjects: 7519
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
