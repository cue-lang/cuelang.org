package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "P10/kVFP++baEWhsD2F0726hpv2a25XT6n0uMCW8Pgc="
								"upload additional file": "3TVRLnOGQr0C11GluxUYu3YkVsZkbYTzvoisrdkqW94="
								"a hidden file":          "KhEWEQaLGZ8wLV16aGiMyk5FZjlsLPE3AdzlV314g6o="
							}
							code: {
								"a code example": "0PJ4dXcXZrGtZsJvAtNVfxFShqbA6NFNuvff3qXrK9k="
							}
							multi_step: {
								hash:       "S7B4JSDKDCHE6I1QTBHIBNKCOJ2RD7HI75QVBJM9E1G87HC1QE60===="
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
