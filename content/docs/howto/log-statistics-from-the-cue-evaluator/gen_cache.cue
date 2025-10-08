package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "+GazE4vU6xZyeDUn+KlDfpoMCDQq0ZSD4IZtptnnvIo="
							}
							multi_step: {
								hash:       "DPE09ELNR9PBFMIRN8E2PU32PEJ15UMPILBCA2O2O0F698CB7FL0===="
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
											\tFreed:                4
											\tReused:               0
											\tAllocs:               4
											\tRetained:             0
											}
											Go: {
											\tAllocBytes:   1419584
											\tAllocObjects: 7533
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
