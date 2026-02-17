package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "GsDUkN3G74Hmr/NgKbW5wSascnuCQ5xBNJ37qnqyxPw="
								"upload additional file": "E5va+bQQB6NeGkOOXDeCnuFQEfX2+ydAQJSqjHZAu90="
								"a hidden file":          "FcRpOk2uAmYyayjAvkMdKWVTbiVBTw2sXT0czD6TQtw="
							}
							code: {
								"a code example": "LGSXUjDp7k/7FtGIZnsaZzstfZrIGPOEbkI7tXFY/CM="
							}
							multi_step: {
								hash:       "J0V8BTCDJ5D57D1K61G8FL9DOC5OSPKTI4F5VV3971V3P1PK1TN0===="
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
