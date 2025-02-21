package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "/i8xnhXPiMj0weRCQ0ShedtbmtvXJosPkhJm75YEFoQ="
								"upload additional file": "e3Ytc0/WPsElYnmYKf3ekC/lvyK6kw6HllZwUUYpKt8="
								"a hidden file":          "HmDHkCcSf8HeLsnvGpGaqq96MdwqKTwtAxOW1EijMWs="
							}
							code: {
								"a code example": "8afdo0PfJkoQQ1du7m6z9+/9z/49aH56Z8mBs93alfo="
							}
							multi_step: {
								hash:       "MU8HLEEPAOCN3J31UEDR1UKMCHSKJSUL81L8OTL6L47H80R28A30===="
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
