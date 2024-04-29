package site
{
	content: {
		docs: {
			howto: {
				"log-statistics-from-the-cue-evaluator": {
					page: {
						cache: {
							upload: {
								file: "mpkjmtOqCxG5v3bXz08kTZmTFDfmcdhdPs0OrMTPWMI="
							}
							multi_step: {
								hash:       "HN0QLO5KFEN7US1IDGSK5RMDHR2DF628ICV9S9AP1HJ4SR52BG50===="
								scriptHash: "8F9B4L7EI11DQ1O69N50U0STF42OF2S5LH0A0PVCVEH0BGON8LAG===="
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
											\tAllocBytes:   4464320
											\tAllocObjects: 49736
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
