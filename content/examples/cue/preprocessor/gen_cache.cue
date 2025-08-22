package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "QcWx62PrrfqFOBuIC/O/EeQydHSj2UdSs5E7xXfj8fs="
								"upload additional file": "SBdyH2JSEyKb5AoU1dJV4nt7KpamKlqWuh5ALYCDzGo="
								"a hidden file":          "SLPOBGl9BTMC65dlj2Wot3mq0+33P2cK26/zuQFDAvk="
							}
							code: {
								"a code example": "PniBj2dLn/ulyKr3F8hQEHiVS8hx7CrdARdVOuMsmRE="
							}
							multi_step: {
								hash:       "VIUEF1DIKE2AR4T13JB7COFVPG1VB3CB59F7JEJ59IRQ29B68EM0===="
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
