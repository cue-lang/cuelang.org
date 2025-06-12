package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "AFAKtur7f6w4xYeS2dEv9LVBcoccA1ajQG/lVN9zElQ="
								"upload additional file": "8GNZbF0ukG7FRgs79ez0VVErSB19TFSg8dhPVTi20EA="
								"a hidden file":          "RxYe7UQbfg7cPbdt2ymWCduiU41u0GHzwXTQIpxZq9I="
							}
							code: {
								"a code example": "hKUhNgm2WO9nRr2hC96Ke3ZFYqPnAuHbsqwovk6ReEY="
							}
							multi_step: {
								hash:       "EJ8TAGLGU1FG9ROU3B801KJD13U9PQQ892IKS28UQ89N5RJSVQJG===="
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
