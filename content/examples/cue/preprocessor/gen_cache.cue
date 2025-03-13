package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "yRJ+zFka3X9TxgaJmp152ItU58GQC9/tc4w4yAnchrQ="
								"upload additional file": "izvC45c2Mjpcdk4OzaNuimD9szTHHQRpdyiyKtIW7o4="
								"a hidden file":          "bWPjAEG0qwhIm84MTSTkfscaUIlE0KrdT4eTnBsBA7U="
							}
							code: {
								"a code example": "AukdyHb/fheaEv6+7cVqyV2nySpolC/ZKcOXytFqIiA="
							}
							multi_step: {
								hash:       "AHBD16U7S6CBTQO1PH3V4E59SHN8GA9H348NT6KUASFJFB1PM2FG===="
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
