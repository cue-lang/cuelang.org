package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "ASvvA2dPKiSmlIWUPyXGHqmSKWDYI/+Kqz4fr9PRF8k="
							}
							multi_step: {
								hash:       "TT1QTFBQ33BO5GICQ2VOC4DMAGAJUOGQNI3FB1NP2VDBM7003R00===="
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
