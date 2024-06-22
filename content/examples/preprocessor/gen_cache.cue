package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "P0OcEB3X11W3CNOyT33HFwAD+n7OyqrZq/u6OVUAxYE="
							"upload additional file": "IdPlD01dcBwWx0cVrOWpE0fNTSUsjv2sPpN2zrOxT/E="
							"a hidden file":          "6bmRfiLesEm8N2Xra65zN5CKsqKtYh7yKUh9TA1xlq8="
						}
						code: {
							"a code example": "q6F8gUeGzjypKX99Hmv8ajloQJ+mNtzAgCVSmaQGb90="
						}
						multi_step: {
							hash:       "P1109S4FI81L8V0DI6LMRCJ8Q4TG472CHFFOEVKSGSO8I4RTOI9G===="
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
