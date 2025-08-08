package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "CBX3LvQ02YBCc/RBvmJ1QXHShs++QSbI4d13SKBisUQ="
								"upload additional file": "uXhNUoA/Vw+/qNWNlqGxAs8V8Xlsi0dhvVlTFvr69ow="
								"a hidden file":          "voSuED4Z0j5HfS2IAfaXpuwVm5jAv/SyK7j/ATjJ7zY="
							}
							code: {
								"a code example": "DjoxwD/Vdx5daKJV1Yf/ta9jGsbVsp7ylcjcspaqU1o="
							}
							multi_step: {
								hash:       "NT0I2JHNU4C7O2R91J40Q2NMG4JPUP09RC7S9NPMERGE0JCRCS0G===="
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
