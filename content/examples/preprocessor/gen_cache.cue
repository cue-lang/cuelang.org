package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "J1gb02Tj5kvRAbpy/pQt74yoAnAWHM1ZERRVV+1Vh7Q="
							"upload additional file": "ZS2YnxFAPWPW82EcVhQ+aVF3wrAKXeC2dEUTI+zZ7EA="
							"a hidden file":          "DbIZFH7IrpA/2/BqOTGXnplxnrxqGcqpSmDIlum2VI8="
						}
						code: {
							"a code example": "zvsNmySwj5YMvfcyFIFppLBkjx4KqIXxB9bY5vAXJjc="
						}
						multi_step: {
							hash:       "H7QR2AFET85PNPMVUQ93Q6BEF441PJV6OH1SO3SVOO06GFGUMNJ0===="
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
