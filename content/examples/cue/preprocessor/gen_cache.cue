package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "7YaEEDowqd0me4c2pMB4HfjUQ1SV9qAr8SYe+F91SDA="
								"upload additional file": "6kgEWqBebdoIe7vWl+fZftBD3pJk6cowLff3288OxZU="
								"a hidden file":          "6JJLZ5KOPslwAdKITkXH8rtj+3KcC2aNm4b86fJ6D0Y="
							}
							code: {
								"a code example": "FTD5k6U+KqC5DTj90PoFu71G8nwkSP0asznZyUetoqE="
							}
							multi_step: {
								hash:       "S91GHAPCITVN3KN42DJ8GCO260HT0T0KOSDRD2CED0BABOT5OTJ0===="
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
