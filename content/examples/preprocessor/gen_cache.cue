package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "W44jiRD8RO+jTDZOIVMah5PtcRlfj5HZN6PK7slFNv4="
							"upload additional file": "E6jrYZbGBP5QmbSgdLo5jEeB06BFXipOnQCgzWKRx3I="
							"a hidden file":          "tsDXe/Jq0LxtnSc6GoWp2lNRVEebMVc776GQw2HvHkY="
						}
						code: {
							"a code example": "mh3M/VLT8xMMHQT/00W4yyBZZ34W4NXMjvc9a0SVpSM="
						}
						multi_step: {
							hash:       "2UC1I25KJIO85RRIBS7FBPLD72DASNNIKFARSKKSNAMRU1GEQ7EG===="
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
