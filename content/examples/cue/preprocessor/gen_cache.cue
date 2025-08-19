package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "ifj6tHi6Xa5ScIm+hSn0d07wrKnI1CPKkEL6FB/OMiI="
								"upload additional file": "yo2bPgSyZoaa8FL9hF2GkS3s2IhSu7tjMAaM2pXzCVk="
								"a hidden file":          "EuwT8514/+YJjmtlOqG/SEWqFJZ0B2N2ggsuVI1eW4I="
							}
							code: {
								"a code example": "4QsCbX1y7G2Ae3BpIVyJKSGTAWe21GRYWOO+YIlj+wA="
							}
							multi_step: {
								hash:       "2N66E49H3HGPTANEIOOMU9THQI533QAJQ7OCEJQ3TEHTPTO3027G===="
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
