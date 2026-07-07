package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "+X0T4CEye4cFClD2UiCdknQDY8dBHl3nzhbpG3dFApM="
								"upload additional file": "Ly6GqnW81DWPVMwSuHL/+2r+2gILQ0Nz6BUl6sEcX5s="
								"a hidden file":          "k8KaYUpMga0GAtc8qIWHalGJuRyfBCehMSq+O8//3Sk="
							}
							code: {
								"a code example": "9HeQgR++Gsv9PfJur+nA4GsH1OuwH7azKHkYcH8tFo0="
							}
							multi_step: {
								hash:       "BV192A82D7IPVBHOIBR23144E6F6QA2VJCG271CIA0FT2JCTRA20===="
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
