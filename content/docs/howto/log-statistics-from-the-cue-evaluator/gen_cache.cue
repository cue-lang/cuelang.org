package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "Bm0VYyHZYOW0bgSHZWyKTrvBKNa2m+aR33ouMkOni7k="
							}
							multi_step: {
								hash:       "EK50SP3MS90O06RLQBPK0LJSRHVNDE9RDD27FC56KM6SA86LL5S0===="
								scriptHash: "R3M8MFMJS68J2L8TB8LRFGODBRB7904QUPMOFVQ9OEI7S01SE9H0===="
								steps: [{
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
											\tAllocBytes:   6005696
											\tAllocObjects: 71780
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
											  AllocBytes: 4920768
											  AllocObjects: 56675

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
