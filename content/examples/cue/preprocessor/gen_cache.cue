package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "TpcpIQTxfNZ8EVr7kJPVMPEba9zv7+rpFhTaWYu9isA="
								"upload additional file": "7xnabodEjkdRX0XKsHCHNmbriU+RPqlb7m6JnsAs2tk="
								"a hidden file":          "SVAsg+0z3WNRkf+ATeQfy9yyHqcN1eJG2PO06hCgESk="
							}
							code: {
								"a code example": "xp/EagxqzXh+Hy4StwmX2NE9jGj+i96P3hOPlMCMHMs="
							}
							multi_step: {
								hash:       "4CU19J8ROVAUVDG9LGJS2IIPK6RR5TKJQ9RSO4VVNGIADNVJ1OUG===="
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
