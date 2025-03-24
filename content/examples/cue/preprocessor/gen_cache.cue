package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "aWcR0jrVo+c6wj4MPyj3vrp1PbaqXBWt2HIzUDDGb3U="
								"upload additional file": "kI8PhKyt7wKRQ7uIpB5dS6hF0F9mmSlLz37skDzRE44="
								"a hidden file":          "pO5rZByvGkexYqc354JBE1/2l1S13R2HCQZt93ikWIg="
							}
							code: {
								"a code example": "riC2LYpJug8kWrMN+YQXbxQSHDa4Qz6a9+KUmiWOXhI="
							}
							multi_step: {
								hash:       "GTOTVSEED4ON8NL4R6NLVLU8QOCG23SSCSKMDA9A3UM19LF25JKG===="
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
