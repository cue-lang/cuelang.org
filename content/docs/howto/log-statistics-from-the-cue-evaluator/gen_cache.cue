package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "9iIJmW1LbcsQwnlLz3oZFyFvXKXaCsB8YXATL2sCblQ="
							}
							multi_step: {
								hash:       "DBMSUV7FGOB8C3RJHG5DD35OQ4U5V89HV82FIHP3NLEBTB05JMBG===="
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
											\tEvalVersion:  2
											\tUnifications: 4
											\tDisjuncts:    4
											\tConjuncts:    4
											\tFreed:        4
											\tReused:       2
											\tAllocs:       2
											\tRetained:     0
											}
											Go: {
											\tAllocBytes:   4015312
											\tAllocObjects: 42077
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
