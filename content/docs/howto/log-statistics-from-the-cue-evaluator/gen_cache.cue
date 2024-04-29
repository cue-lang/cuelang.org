package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "zsBwjwF3R+a0N+zO6MCgMt4Nzozk4BiRwVW//tRgvyU="
							}
							multi_step: {
								hash:       "G4BLU2JVMA2VV9B1IBH8IN4Q35R2J2NQJBSD9HV5DNIDDNT1B110===="
								scriptHash: "THPPLG3I4JS8FUUI9C620B8ON2BLHMM7KP7I5SKNMV8NJNIGMOGG===="
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
											\tAllocBytes:   4461192
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
