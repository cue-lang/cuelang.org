package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "o9PRJQT+okyRaZrJQA4UgguS1C8H3LCIjEWeaLxBBjY="
							}
							multi_step: {
								hash:       "KP5NJ6PLB2FCG129JD0A7QAA61VA9F9ABH25IU8NNEO01NTF17NG===="
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
											\tAllocBytes:   4456248
											\tAllocObjects: 49722
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
