package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "rSFijXQAfoe2jG8atZk/5EzaxKt/4C/JV/iRFoJqFhk="
								"upload additional file": "B0Phmnk1HtcRk6TtPFgANakCRm5KMUtKENRHM4Y6Sis="
								"a hidden file":          "oRzh24lQIHKV7cV1JikTQEwlm8AJ1VVDbAy/Hd40K1k="
							}
							code: {
								"a code example": "nxT2Nxz4YWBYMk2G9COKYYj2da08QyeEmTlvN9ijnOY="
							}
							multi_step: {
								hash:       "AE0QBMESPSHMN3E4R58C6KHAVM2DV0FDS79F1KICFP6UATRTRVGG===="
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
