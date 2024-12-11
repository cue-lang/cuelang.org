package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "JCfIVwkF75lAANC8xGXyPQAiiOx16dSwmxKXbMNVpiM="
								"upload additional file": "efbAuMANSkO8jwG6C1JsKOPwrXeHCYc3O7qU7li68kI="
								"a hidden file":          "CovH4UKFJVECkXN7WZ3EyWDCui6l/CIG9/aIBLCRaNs="
							}
							code: {
								"a code example": "21tkFMF8jJXqexoSffOCWifA11tcnIz5KKBqppvpSA8="
							}
							multi_step: {
								hash:       "BQG6KORR6MCMLK8EJ1ABN0QLMV7T5JKHCNKL3H61UMJEUNBR9AC0===="
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
