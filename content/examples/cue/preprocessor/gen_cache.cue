package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Avw0vdbH+rthn1rK3Yo96W8vsFgBf64pdKoGwqvzh0s="
								"upload additional file": "j/qCPPpvNrFRE0AvLdt23J+bUXg2WogCTjWXqbLsOxE="
								"a hidden file":          "JprNMw2u8ahZE+8s/3FHgGn178ZHlI50hUuICcuWesY="
							}
							code: {
								"a code example": "9d3NjJIz4qlB/xQ1cNkPV/5QEB/+Or7TNS7r6V9IkFE="
							}
							multi_step: {
								hash:       "EDPR5VHHD7TS3JKI8EHKU5ED9TGU4PSA5I3VNOACG7A1ABLNOJ6G===="
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
