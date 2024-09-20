package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "vRTmq70C/JufD/pvm9hk2/xoRUuHfxi+Y2PmnYuAqZc="
								"upload additional file": "2JcxECoqzEG7O6JZoWhhFr6QMMOvQgp+zRFfiRm5qCo="
								"a hidden file":          "Nr42Tg7cxrRdtAi7lv9mUzQl/ElraGe2glvObaSdAoE="
							}
							code: {
								"a code example": "nTESVuVgPHI2M2PGIvf7JPDPsAGS3ZHVaciRczLq7YE="
							}
							multi_step: {
								hash:       "7JKU9RE2DBOJ0VV143AON9QLUNB5PPGF13MGKD6L3F089S817I6G===="
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
