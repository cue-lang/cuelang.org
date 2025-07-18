package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Oosx4OUENmdqaAVJYxRdxamubaa/JoRG/ozFPfA1V6Y="
								"upload additional file": "9Vfh2FIgA9x4B0r06DQKjsq5zj6QKYuTLSJ2hDNQh+s="
								"a hidden file":          "3vqa2RlNjgGD6cn/4taBIO2eu+53IKs3fTK4HmNorNI="
							}
							code: {
								"a code example": "Xb9Uo7hhWdiBc/WjxC7yVvxwkJwOMHOjSh2XrbId4mw="
							}
							multi_step: {
								hash:       "Q2BH4I7EQO71E4PLO9CC8P9LPPCBAM3CL67ODJTM2GDIILGTOAK0===="
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
