package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "cKYBaYY5fM66+FjbLXrmyB3eXRiVQjWFbCi5YDufM6I="
							}
							multi_step: {
								"2GT4774S0P25J3FS4JG9Q604MISIM4GC8AARH9L5VNBUBTHA6VG0====": [{
									doc:      ""
									cmd:      "export CUE_STATS_FILE=stats.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "echo \"This will be overwritten\" >$CUE_STATS_FILE"
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
											\tAllocBytes:   5942152
											\tAllocObjects: 71556
											}

											"""
								}, {
									doc:      ""
									cmd:      "export CUE_STATS_FILE=-"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export file.cue >/dev/null"
									exitCode: 0
									output: """
											{
											    "CUE": {
											        "Unifications": 4,
											        "Disjuncts": 4,
											        "Conjuncts": 4,
											        "Freed": 4,
											        "Reused": 2,
											        "Allocs": 2,
											        "Retained": 0
											    },
											    "Go": {
											        "AllocBytes": 4911816,
											        "AllocObjects": 56746
											    }
											}

											"""
								}, {
									doc:      ""
									cmd:      "CUE_STATS_FILE=cue:- cue export file.cue >/dev/null"
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
											\tAllocBytes:   5986376
											\tAllocObjects: 71843
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
