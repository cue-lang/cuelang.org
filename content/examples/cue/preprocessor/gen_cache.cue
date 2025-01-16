package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "61bHaYEIKS5ntjeJV6rAgx5IeZZg+UPwliYHCOJva0E="
								"upload additional file": "l6Y8U7E57tZ0A+QODLAM9a+7FEABXk1yWiSl3LwnT6E="
								"a hidden file":          "GiAwA5EWi/dlIhFWNg0pEZ0cEAHqp9wT9jY3UYtbkpI="
							}
							code: {
								"a code example": "GaRHYBbjO3zixW8foVoNbPdrQeqL1R4r8Cx/vmYza/w="
							}
							multi_step: {
								hash:       "LSM4ASDJ9OCK7N8RPC1LB5QCRJPPGVCUKPMGEKEHUP4K8EAP9FPG===="
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
