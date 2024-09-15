package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "PptpN38k/f1fbhTUI4Su+PlQ71SamjYh1UmO1yuCJYM="
								"upload additional file": "xzPniQ1gk3S7p8Hnza7jw61g9GxqYe6Jcd3k08CwzCs="
								"a hidden file":          "ZXtQPuIyavGRyJM14g6vMbvvk79VxOvAfvDhUHAJPns="
							}
							code: {
								"a code example": "21blwwPI0Xt8o3cDlz1pMERr0cQjZy19DgD3LRQ8lFk="
							}
							multi_step: {
								hash:       "FDU2PAJM6FCB8DGKA27F7G7038C2JF23NJSKNTEBHRK98THVVL2G===="
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
