package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "yMNxWzAxV8B0bafVmWxWdPzwAnVmipvgjJ8hEwdrzdY="
								"upload additional file": "CpA61FW9LRG0WKfxKf7LOe4QmOhMgr/yOi1rHfeVqD8="
								"a hidden file":          "88eOCW/hajU6AAdVW6rNxiyQ+EEQ5eEapmwMzSJWfQc="
							}
							code: {
								"a code example": "dntKb8DCTBI0Nwt3ZgdThRla9Qwqg2n/Jb1z55sj1Dg="
							}
							multi_step: {
								hash:       "758I6CUBDHTCAK89CF017EOKT5SJ740UFATAJ23GV3BS1A990R0G===="
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
