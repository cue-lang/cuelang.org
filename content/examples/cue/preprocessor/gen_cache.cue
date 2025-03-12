package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "q6VSZOoBhQtNyT/1V+jMu92UfmtOJcAnotIJDX5zMvg="
								"upload additional file": "TCBff27mq3OGDMKWdYc0EgTAGHwDZCSl2HndZUAuJKw="
								"a hidden file":          "HKBI4u5QMZv+L91JUpOa/54/FfdEwtfNBGcmK2tjLy4="
							}
							code: {
								"a code example": "CKGweeyB8fz0TgUUO9/C9+orq0IGmuCb8fjqdqFugqY="
							}
							multi_step: {
								hash:       "H8LRO9AV9HU0VABB97REBFL2RVMSUCJFKJP09IM167FML62CVBQ0===="
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
