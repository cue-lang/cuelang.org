package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "XHth4yOnwyW1OdcbH/9JMpKOf0+sZyGE0eOe+aNxmfU="
								"upload additional file": "8sGmnaPkrDv+F3H/cs4xeiLzqLPGorfRcY/idBuDoo8="
								"a hidden file":          "QzEvu6DoADRijkToaOyF8B5q1igtmH/GfhU4QpdfbWw="
							}
							code: {
								"a code example": "h8VHgDsFyH4Eb5iZdLVJF7tgDLZ66pXf/cV2dw8Fz8g="
							}
							multi_step: {
								hash:       "1MTEF2FKUKKJPH7TCH4KIH8T0C3M6BM8NNGRJHERL3JE65E3EB1G===="
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
