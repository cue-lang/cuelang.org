package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "Xlw7aj4cG5AC8YjrOnT+wopUlPo8NMhXFYwKibV/2uo="
								"upload additional file": "qxxHsVciIEVgQ3In5lbeENAQqQOK2jbAtYFrZZs4cOQ="
								"a hidden file":          "2kXqGDChgDTkNzqPalmGVTjM1qBbQ4dyqv+NcddEgQk="
							}
							code: {
								"a code example": "JRQfvLMWWVhOtYQ/Lakb8xISVxzePn5sCN7wcieNa1o="
							}
							multi_step: {
								hash:       "SKUCM8EK5OUKE8UL551F2KNEFD18HKCJ2KV6F00Q9O6SHTHULMTG===="
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
