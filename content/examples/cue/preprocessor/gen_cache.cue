package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "hxeXQ2G8genZaBZBnk/2Onks8PJD8HL7oD5AwS9u9pI="
								"upload additional file": "2bgauY4pZ2AYK3sDPEKLvJCE75KLTsPrjGuvsxTrkn4="
								"a hidden file":          "6QHk7wgbsuObeh+mRXd/yGuR2IwxCoy/z13QCRIpPoM="
							}
							code: {
								"a code example": "OCI3/I0Hg1Ksrbo6GHAS4tW+9K+aaliLhzjqRtSnw4Q="
							}
							multi_step: {
								hash:       "SMU33PGLIRNJ94CRFTOAU06KKJD2UCUQT8VP0B71DBRTVRC21CRG===="
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
