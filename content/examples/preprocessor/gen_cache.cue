package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "BWEju1Mpqjmw2IVfAhGQ7L+cIPvrEK1cjmt98Q8qxlI="
							"upload additional file": "vYAi5RhmXQYxWMt+l8NRy1d2xgGYKrI0NweUpirijqc="
							"a hidden file":          "8xYlSMAcEQRG0VeA/INGV+6yUKzokwPZGzg4565MzrU="
						}
						code: {
							"a code example": "SM/WAxCDu5mJw3LXHpcAozdx8SBjaGarOHQsT+6sq/E="
						}
						multi_step: {
							hash:       "HP48JB4SKJBVHKPT0PRE8A9EHI1EP2S97N3D21ELRKF69KMSSULG===="
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
