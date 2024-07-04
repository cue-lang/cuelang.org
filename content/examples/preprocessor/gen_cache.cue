package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "lwW/VZd45OUB1XrhnmRNb1ViI3oh0CZ+dcxG3rY8/Ss="
							"upload additional file": "bT4pVxO4HTWVT6kpkElUTD1kQ9jkBhhQU9AmP6T+Vmw="
							"a hidden file":          "3VxsNWNCWA+66fGFVm6hD0D3nQooz53kluIPwzOi0rM="
						}
						code: {
							"a code example": "EWcPjqZKUUsTRrb0lzpyDSu/s1Vcqdgwve50h9dFnRE="
						}
						multi_step: {
							hash:       "4H1614JGBS6HDEV0SVO8OVRE64KB6BM7H543QGGJ1B8TE57ELABG===="
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
