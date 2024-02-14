package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "NjIvhP7NUGNACZHlHZt/jqkpYYyzP1ADo5CYrFLPLjA="
							}
							multi_step: {
								"SM0D2AJ3OR0UO1NRP6M9SDNEO85KAERGHGRE51IPMA4JHBRPOGT0====": [{
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
											\tAllocBytes:   5956624
											\tAllocObjects: 71714
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
											        "AllocBytes": 4922232,
											        "AllocObjects": 56867
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
											\tAllocBytes:   6006688
											\tAllocObjects: 71979
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
