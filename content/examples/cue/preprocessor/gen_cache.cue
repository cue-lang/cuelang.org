package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "/K0NJAkntoMZsuA9tZY1zD+fbkWVWIB55npoEt++Nio="
								"upload additional file": "Bg5CUQ2bEDI7dOsT2AmQ2x04BEr1pLMdRGtex64tETA="
								"a hidden file":          "sniNzWy8c75CsjSxGwxuUOoR3hd92XKpQTYMkL8/4nE="
							}
							code: {
								"a code example": "a5K4CXwa3K7jfsycWD++wF9OOHIsr2xJ5m74fbH6lY0="
							}
							multi_step: {
								hash:       "7200TVMPV3GGU1AAD08CHDJ5H7ITM90NN8RBM5MMO5VAKNV3V42G===="
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
