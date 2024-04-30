package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "moqIRcTdJE93+cfEyA3EddOLa7rX6VZLOAEYbbMjI8E="
							}
							multi_step: {
								hash:       "LUKJBCGN4771C4OHFO4B9DHIE2T4EBU45S69FM4EIFIMCI8C5RHG===="
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
											\tAllocBytes:   4467744
											\tAllocObjects: 49745
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
