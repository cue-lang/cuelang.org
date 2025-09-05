package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "zpAOlmixMDOFCgJWommnlXQt0nEcO4Ks68Yf1nve3G4="
								"upload additional file": "InzFuP+HaRJwkchAY3UmOKbs1z00ho0jmocIKEipBss="
								"a hidden file":          "Kh47Odq/+7UaYNXVPaOevtfGUghvsELkbBlA1LmOLoY="
							}
							code: {
								"a code example": "ekSFVT5HCTehYNZIKXOL4nUvbnZXmJQMSVtIXf/0+G4="
							}
							multi_step: {
								hash:       "5UPVI93G4EM82QA66EFEPLOFE9M5VDRNIUHIFU003E2H5BSJ54T0===="
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
