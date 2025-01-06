package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "bZdjp+2j4gE/R3WzqZjhGLmYMiL+XZNinoWAh13J4OQ="
								"upload additional file": "wDO9CrNbQiR9efUaeNkGLGcJuA3w68bE4Y/2Aa3qHsk="
								"a hidden file":          "yESL5LuL+giK/sgOLg9flab8TjklJCD6zEHCMTl9X0I="
							}
							code: {
								"a code example": "1m+GbLzwXQ8Tvvh+3fGc6tNtu0QiUowVwkgT47Hshrk="
							}
							multi_step: {
								hash:       "2H34OP9CCQC4FPI87RD754JQ5EPMC9CSNPNC9Q45TIKSNKBN5UH0===="
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
}
