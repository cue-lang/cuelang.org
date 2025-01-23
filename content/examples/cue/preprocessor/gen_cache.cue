package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "bkKBjuoSWxzLDMKxXfoFlKX/rn/ZJrNhYvZH8XMO6qY="
								"upload additional file": "q21+TzdSRwER/oUpcyLIl0U4FVo+d/9enTTfgzeGdRo="
								"a hidden file":          "2QcSpJNX1Bfk8Thpokxp9lMQO6uNdb4Bl6+yxbH8/z4="
							}
							code: {
								"a code example": "bzWpYyPP6R4Py/OOJmUAmDxFoXlYhEz9aalXDSArtz0="
							}
							multi_step: {
								hash:       "VKBGUCLER12I0VO6FMROV8MNGAORNO5B5N66F63BKCEM9VCOACVG===="
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
