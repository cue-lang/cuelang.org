package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "zXck0RyZv+HH7Q/76RiJPAGp5QeAs+3ai7W8iqLkeGQ="
							"upload additional file": "I9s4h/59pYooOX8aMYBB3oBDCsoddDH+JrttX9lQ5zI="
							"a hidden file":          "1u7j3kZ4lhMGaGpQquJ+FnUjibh3U8yLvVHCt4jVfF8="
						}
						code: {
							"a code example": "p2bZ2aBy17oDa7EjIhw1L5vmdka9nZ2GsnGsu7XnkFE="
						}
						multi_step: {
							hash:       "U3A03BSDU9RF14479BO1T68F9NS7RGGFQ1P2ARR5URVR1MEM7UO0===="
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
