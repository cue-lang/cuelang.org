package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "CjyzpYYIH3UvkgGh42UHOjf3rTknlvPLcUuGsb5yDRs="
							}
							multi_step: {
								hash:       "5TVO4QBGS7HUF05V942J17GBREB59R0460CSII8VATL1VA5P05L0===="
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
