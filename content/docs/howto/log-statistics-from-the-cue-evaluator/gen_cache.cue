package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "L355DrtGASo2CxSDms/cnsOFwRgWwRjoC7nqJ7V+Qco="
							}
							multi_step: {
								hash:       "A709N328C0R4PGQV85594PJNH6AVFFMASA73IBEU598HEMFACBN0===="
								scriptHash: "8F9B4L7EI11DQ1O69N50U0STF42OF2S5LH0A0PVCVEH0BGON8LAG===="
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
											\tAllocBytes:   4462808
											\tAllocObjects: 49728
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
