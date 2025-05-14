package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "VO06Id36ymdOR7xDAIXAJGRdChjPwK4KDWcNE2CL7JY="
							}
							multi_step: {
								hash:       "8BSRB3FQ4G5H624H26L4305K03KGDVBVO1F78E40H9C30S2UAS2G===="
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
											\tEvalVersion:  2
											\tUnifications: 4
											\tDisjuncts:    4
											\tConjuncts:    4
											\tFreed:        4
											\tReused:       2
											\tAllocs:       2
											\tRetained:     0
											}
											Go: {
											\tAllocBytes:   3967792
											\tAllocObjects: 42729
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
