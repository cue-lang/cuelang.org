package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "H6wIu2vBf3evtlGa+IUnmV8iZEDDK3El+SVil3ceAG8="
							}
							multi_step: {
								hash:       "D8V3MHE01F9D3EAMOAECSOMHL5OII29M8I76K6KB7LJACNJODJN0===="
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
