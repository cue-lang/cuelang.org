package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "skUF9jOJJoGb03nd/j40KE1d73b6Sf+qimNG7R7xbdA="
							}
							multi_step: {
								hash:       "GSAGV2BALLJTILN9PF9IK926JQIS4PLLFINTQH3SUU80M42E5MH0===="
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
											\tAllocBytes:   1699328
											\tAllocObjects: 12726
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
