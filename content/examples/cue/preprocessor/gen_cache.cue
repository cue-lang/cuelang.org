package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "QyvzGg12rKyOW+OQXbaHSNWQfnNqUEzVNZzrVrxmFMs="
								"upload additional file": "MmJL0FqjVl132Lk6DUPfrMEUk2tCT3MPpS8aKgFzqHw="
								"a hidden file":          "4Iwzh9bn4l4Gd0sbOvW9xWuNWxF0AOw3xCa8XHq/Srg="
							}
							code: {
								"a code example": "w0Jf6rwB5BIwsN/2Vz83HZBfFl0GXygH6tvFbf5FZFM="
							}
							multi_step: {
								hash:       "9O6FFD4FGOJ4DN62PUBOV8ULPDMM85F6L4DI7CT05O5S1S8QFO90===="
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
