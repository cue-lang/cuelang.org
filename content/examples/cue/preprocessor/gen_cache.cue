package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "/5BSQXGflMSZwmubB1WUwh2Gq4YbPdLwltiYvL+DzMI="
								"upload additional file": "bK4soC0iNuurL1H2HVgD5oVz6v5kOCBecKEoMwEqsAA="
								"a hidden file":          "IZwrfjt1x4aqRzXBw+RP4ap3/kzTN89fs36xTTzH7+s="
							}
							code: {
								"a code example": "l+PcSvEutXuZ8YXBL5yZopnmd2xukc3lDpM73qd5bYU="
							}
							multi_step: {
								hash:       "GC5JBQ3D69D448RJJ5A1O184BEGD6H3SBSBDI967730GS97CD6F0===="
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
