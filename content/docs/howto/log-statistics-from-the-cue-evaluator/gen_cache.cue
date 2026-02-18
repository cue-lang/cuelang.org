package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "rfIdU46RI/hv8tH3+RCS4OLVnVGyD7FodhxCc1I1Axc="
							}
							multi_step: {
								hash:       "O6QU6QI3UAV6HABO6E54ML5MFNEUU1F7O8GQLSF3SRJBJOU6P6H0===="
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
											\tEvalVersion:          3
											\tUnifications:         4
											\tDisjuncts:            0
											\tNotifications:        0
											\tConjuncts:            4
											\tNumCloseIDs:          0
											\tConjunctInfos:        4
											\tMaxConjunctInfos:     1
											\tMaxReqSets:           0
											\tMaxRedirect:          0
											\tGenerationMismatch:   0
											\tMisalignedConjunct:   0
											\tMisalignedConstraint: 0
											\tSkippedNotification:  0
											\tResolveDep:           0
											\tFreed:                4
											\tReused:               0
											\tAllocs:               4
											\tRetained:             0
											}
											Go: {
											\tAllocBytes:   1553872
											\tAllocObjects: 8207
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
