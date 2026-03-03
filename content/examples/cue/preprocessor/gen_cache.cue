package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Hnvbx0QUBPRxx9Ykw3ZOsvseX59LuPhhc/5Ez24tCR0="
								"upload additional file": "KJ2bOtme9mqCNQXtmn/1nST13gfjKk6e3dXPoa1/nY4="
								"a hidden file":          "1suE+H2SgKoXDchIj7dtduYefgojufmVSy4KQykjI7M="
							}
							code: {
								"a code example": "hbTN8OHqqeGZ30z17J6uDkuYxPrkL5gjpZrDWp68aoA="
							}
							multi_step: {
								hash:       "49QGOJLTL2DR7RLLNK1VD57I4FOP9VN0DODEVLUU7C5PFGNIMJJ0===="
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
