package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "XuWvX4Z2ZGlo9mLx4C4zDqATh1L4OQXwzM/ADgI843A="
							"upload additional file": "E6jrYZbGBP5QmbSgdLo5jEeB06BFXipOnQCgzWKRx3I="
							"a hidden file":          "ehTH7iM98/rzOvj+dUjQE3uceC3KNJ3fKeqYU7KbYsQ="
						}
						code: {
							"a code example": "NVGgMvkrbnFDNrRPM4+56LdPQh1WzCXq8V4vDGUZZ7k="
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
