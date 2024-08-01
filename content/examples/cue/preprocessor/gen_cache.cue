package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "lBiyVS3HJcOhUPNYWG40XkOQKkq9ymL9OaWaNUWfLr0="
								"upload additional file": "0YZu23kXR7gYo2SsV630/VjFvp0J1FL/zYY0z8BKOLw="
								"a hidden file":          "UllG9PF06hzs3p+mZCNV+S8GzBstuzH+f6QUdw6d+pg="
							}
							code: {
								"a code example": "aqWN4pOspwGKdU0tFm6iAw2IxhliglvRxVju9tzUDFM="
							}
							multi_step: {
								hash:       "1AP56L15IPJP73CADCH9L21PRJF805EPS0FB4CBA5GHIEFG3RKG0===="
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
