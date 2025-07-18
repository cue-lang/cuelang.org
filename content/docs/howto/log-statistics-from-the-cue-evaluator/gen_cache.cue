package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "vyEMtm7O566nUwG5ncLBU9U+/6+m3knQxTLlIfLp6Ls="
							}
							multi_step: {
								hash:       "N6N736D0J97S5KVUN40A0595GDOQGD7F2CR9N45LFKQ696G96Q2G===="
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
											\tEvalVersion:      3
											\tUnifications:     4
											\tDisjuncts:        0
											\tNotifications:    0
											\tConjuncts:        4
											\tCloseIDElems:     0
											\tNumCloseIDs:      0
											\tConjunctInfos:    4
											\tMaxConjunctInfos: 1
											\tMaxReqSets:       0
											\tFreed:            4
											\tReused:           0
											\tAllocs:           4
											\tRetained:         0
											}
											Go: {
											\tAllocBytes:   1400992
											\tAllocObjects: 7522
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
