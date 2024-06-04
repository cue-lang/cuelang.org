package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "lP9BHiD4bS+mv29bBX0niIzFSTxxDlZuoVKQ7mI9t7s="
							}
							multi_step: {
								hash:       "CC4PSK2I1G9SSCAK46A4F0NMCODE568E1LBVHM7VJ6NAK050FE30===="
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
											\tAllocBytes:   4440376
											\tAllocObjects: 45200
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
