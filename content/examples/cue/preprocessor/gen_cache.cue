package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "YggKUjqdaLTZomDuUrtbYjyiul19vk2QMoOM19zgWHQ="
								"upload additional file": "yxWNd9pzXD3q1JZtulhW8GZbrY6NZ6kQDfGbDL/xSKI="
								"a hidden file":          "m2RmkcUZjg1kmOvBt0o4SV1fveATzGYhG72mqaw4gCY="
							}
							code: {
								"a code example": "whsNxMVq3QUk7gWjVpUxd8HJZaLtBbutRVMjK6yk468="
							}
							multi_step: {
								hash:       "PNFNATTGJCJASD9ENT5F17USS8PUCV3JGRF6046G6DHIOK9TU340===="
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
