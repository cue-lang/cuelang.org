package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "yNsbkEokrniZXYSS9+4Wkt75rd7F0w3HiDa72vplPP8="
							}
							multi_step: {
								hash:       "EC3M0J424S7VO97PKO2UGTVTDKHHUOP7CKSHIM44JMTDF2S35M2G===="
								scriptHash: "LB8A769942N1SDEQHOUQDM8CDG8BFNMIFLI6VIGILI2C4K7PSHUG===="
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
											\tAllocBytes:   4396448
											\tAllocObjects: 49713
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
