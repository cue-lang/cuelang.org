package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "j6xGL7O+bwme3D3XrIq4/2rQ4H+gbXrInZJPqag36k4="
								"upload additional file": "/v9Xe5ornS/+rTqB3lZGarEsyh7idqu2y2OIeCYhcXE="
								"a hidden file":          "PYqL1GGJvxGCwOoVTLypidzTLFGxojYWZB/fnSoY/BQ="
							}
							code: {
								"a code example": "cu8b0sjD30beAUAI6YFccOkxu1dZWcw/I1MslHaWf6A="
							}
							multi_step: {
								hash:       "C0J1Q4C5816TPHAK68HHGLDNNBPFD56K5G5KGIT2D8L0331I1CEG===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

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
											y: 2
											z: 3
											x: 1

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
