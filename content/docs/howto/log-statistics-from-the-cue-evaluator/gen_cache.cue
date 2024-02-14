package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "HVA4oAAcdmbOzqBlnCiGc+QVVB8Q33XGwMd96oFtkys="
							}
							multi_step: {
								"PDSQOJ2EGUUEI5VA61UP9NLVK9RQ009596LB1960A80VDSS4BGIG====": [{
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
											\tAllocBytes:   6003904
											\tAllocObjects: 71792
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
											  AllocBytes: 4920856
											  AllocObjects: 56682

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
