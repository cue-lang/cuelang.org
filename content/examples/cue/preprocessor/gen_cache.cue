package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Ur705qwnh1LJ4i3S4ZYf35KZbncgFEG9w5D5t56vnSs="
								"upload additional file": "uR02BSqFQTrn8sWKVSO6W7mKVq0eoDDu3ipd6F8oiRw="
								"a hidden file":          "jPrRaTKafKX2fCwBTnr/rwNBod5ZLy4oeM8xiAXTSk0="
							}
							code: {
								"a code example": "eSSasXLeYM8kz7vnDPKfrd+HYK/NaQYmpAaJYV4Eem0="
							}
							multi_step: {
								hash:       "MADHMLGJHOER3QH4FPQ9B7AUMIJT0J25CA3ARKDP5BGE3A8A6J10===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											x: 1
											y: 2

											"""
								}, {
									doc:      ""
									cmd:      "cue eval >result.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat *.txt"
									exitCode: 0
									output: """
											x: 1
											y: 2
											z: 3

											"""
								}, {
									doc:      ""
									cmd:      "grep bar foo.txt"
									exitCode: 0
									output: """
											bar

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
