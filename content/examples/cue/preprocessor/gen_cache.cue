package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "r1RKOFKb7bhqTwf50oVbzUekz+ZqqIFrUEWA+xfMiqA="
								"upload additional file": "vHoO47W2yi1l3IrxeT97bYnD5YSczE0LKkD4PDrWc9U="
								"a hidden file":          "WRK8c2NW202sK6EOhTQbi3LvCl6hltklpGb3Cnw50Ok="
							}
							code: {
								"a code example": "t9lAqYQvJkMDpAcIwhjyl7Ti91614U7OrKEDCK6xRWk="
							}
							multi_step: {
								hash:       "9L2P8T69UKJ63P1KR2HVFQJ0L37404ASG6A2L5BJDDKSLMO5HIC0===="
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
