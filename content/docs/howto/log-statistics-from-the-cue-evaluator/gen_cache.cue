package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "j3iB+9ty5cSvZKtLIDfJ91wJ2cxB7nn00W5D7atB8nw="
							}
							multi_step: {
								hash:       "CLITL3SJDF7KS0F1UJEUFANQVOTALK3H36KI145DSRR9I3F46BK0===="
								scriptHash: "HJ6F16PVM5R51CRIHNQVO53OFBM44DDS5QVFKQUAO2SO9APOU95G===="
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
											\tAllocBytes:   4458504
											\tAllocObjects: 49721
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
