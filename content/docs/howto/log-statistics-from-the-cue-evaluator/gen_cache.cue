package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "le38fpkdiCkQ2DTUfn3tF0jmk86GyfZ5FB+dRw3FHDg="
							}
							multi_step: {
								"S39801E36SFI7LKM536VQG51NK4O0NQ41DGU4AI9107Q5H2D8V8G====": [{
									doc:      ""
									cmd:      "export CUE_STATS_FILE=stats.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet file.cue"
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
											\tAllocBytes:   6008848
											\tAllocObjects: 71839
											}

											"""
								}, {
									doc:      ""
									cmd:      "CUE_STATS_FILE=yaml:- cue vet file.cue"
									exitCode: 0
									output: """
											CUE:
											  Unifications: 4
											  Disjuncts: 4
											  Conjuncts: 4
											  Freed: 4
											  Reused: 2
											  Allocs: 2
											  Retained: 0
											Go:
											  AllocBytes: 4920760
											  AllocObjects: 56694

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
