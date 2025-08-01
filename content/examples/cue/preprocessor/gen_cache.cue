package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "JQgoRRA2VG8TD159XMoVErMsLw4DjCGZypyfzsGWcU8="
								"upload additional file": "u1owswanJnD4wGHo75N28je7t82CGsdEucfvjjsxW+o="
								"a hidden file":          "WDWe5Q5v9GWFO58JmGmDcPntavwXS0LDy/3MiZ9/JWQ="
							}
							code: {
								"a code example": "FAhmDxNfx++n/PWNr3odACQhvaASkUUTAgll47zFchA="
							}
							multi_step: {
								hash:       "8J2R5JQB02U31ADB85BQGFE1VOL7CNFTQFU1U4AEORE5UOLP0R7G===="
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
