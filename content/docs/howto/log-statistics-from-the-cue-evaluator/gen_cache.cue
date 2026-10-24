package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "dUUSn2RnZaDXlF2KEAq+gaYpr8NvaMZZwkfhnR9phzs="
							}
							multi_step: {
								hash:       "DHVEV520SV501BM9G95RBEBAV09CEBNQ42A5SE52LHOA3JKPQI8G===="
								scriptHash: "9QS4NMM0SOKK59RJ8FUMGMTS2MEQGVE77KG0I8OORB5T9UNJ7QU0===="
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
											\tOrderEdges:           0
											\tFreed:                4
											\tReused:               0
											\tAllocs:               4
											\tRetained:             0
											}
											Go: {
											\tAllocBytes:   923808
											\tAllocObjects: 4426
											}
											Proc: {
											\tUserNano:    4217000
											\tSysNano:     0
											\tMaxRssBytes: 19861504
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
