package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "W5UvaO17axtrQPuQKwVHhhaYYyU7b8A9Ibl7Pgkvcyw="
								"upload additional file": "eDNkCLIq5IqmN+s4H0RjjRf4unfIX5siKsnKp7w7iAc="
								"a hidden file":          "8zhAhJz8XrzVAtwBsApRGrbDVBNIqRNY0ew3bWzau2E="
							}
							code: {
								"a code example": "wl2UkO+HzJ+cbSue6NAZfUJomZMD2HVJBD5r96H4fjw="
							}
							multi_step: {
								hash:       "JRVPF4S7B38QDTLQ1HRLOUSKMU5EIER3FBOB7I1GULDAJL4FCULG===="
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
