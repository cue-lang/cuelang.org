package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "A4soxTIlU8gLOfP/PuRUZSYorZCZW/roYzVvaMVyhh0="
								"upload additional file": "9tm2Pb2nvkYSj93JzIxU1DisZ2ma+nDPYUv1PnE/V3Q="
								"a hidden file":          "/sVk2zBw+Lx9Za5UAyAFxe9q62C6ZbGmSg8WxNQPSLQ="
							}
							code: {
								"a code example": "rBdh6BWnyq9xpVxIsAcinUfTgFa8w2v0ggS/Y6RJ9xU="
							}
							multi_step: {
								hash:       "V3JPU939DS7HR4N6TPE6BP85KDTO4GP6TSROCICIBHU6EHI7M8TG===="
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
