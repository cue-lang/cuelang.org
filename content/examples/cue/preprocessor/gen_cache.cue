package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "8WEOBkH0xmmjNxos+Wp9EbVBBjTjOW87Huiik9s/aj8="
								"upload additional file": "DO2JNAhHSKNqovr8KfXgyG+5ptnqrtJExMsaz4Kcylc="
								"a hidden file":          "TDnKDbBtVQrsclyocwebqm5MIDXYchzTG3hZ0IdidMg="
							}
							code: {
								"a code example": "Pz7AuuYZNRD//g2REnthiOJayYgVz4dOWXOKW14ZyrA="
							}
							multi_step: {
								hash:       "L6EK1C67SVTICGN5T0UGU8L2F8R5FG0RCT6BFHPV53BPI4J9F9LG===="
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
