package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "w55InvX6CGKd9jsNorJywGFNINc4e8RBX7RZrvswi8o="
								"upload additional file": "i/XszWnn1xFGcyNfi4bTe4u7+iD+R8HC0xXIaaiS1zg="
								"a hidden file":          "hYh37OjWsZ0E7X0MgTYIYSNS35fh+iQ0Vezqt+BnQy4="
							}
							code: {
								"a code example": "Ve1ShxVFQ5zLnHMiFlIMgpXoLjk/i/qwWB5WQHbwE1A="
							}
							multi_step: {
								hash:       "DPO46L8NSN9CHGDFG88AG3LA022DGNSGSJOVQ6O547EJJ6N0OME0===="
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
