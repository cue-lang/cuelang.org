package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "oyVPzjW2yee4AHENZUK34YanKZ3YqRs5krtZDjHlqCw="
								"upload additional file": "ZRLseqTAmT+kTL/9J45PjHRr7XoC7jUjg8w+gBqLOMs="
								"a hidden file":          "TGWmEXUXujiqOTqaQEE6Fcyqxy8r7RAKwcWGg+8suxI="
							}
							code: {
								"a code example": "bS7297a7tDpkz++Fiskf8LeTa/ATLMESmcnbYQoagJQ="
							}
							multi_step: {
								hash:       "25RN5VI9P6S7G3GDEJFP74L7E81HETP6GPTCS7F5U286S2V4AUF0===="
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
