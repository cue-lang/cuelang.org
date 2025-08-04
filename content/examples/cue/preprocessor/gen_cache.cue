package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "4VKfYD5Kkf2W2D/7ZmHyjsOChqLkfPcGCcarnkmriw4="
								"upload additional file": "HAvXQ4k23y6nMSuMgOAQvoN3VYjv1054b3I7eKLzoy4="
								"a hidden file":          "kQMQUXPvMSI0Q/L4Ghl1//gId50iktwNXIN6fuT5EgI="
							}
							code: {
								"a code example": "y+k01TSmMBfpYZqKrvBUVGt/jasaGqwTeLN4UHpjcns="
							}
							multi_step: {
								hash:       "KFTTLULDNBFRSK295DTSLIJBHIJ4DBQ2DHPGGHEFMAFPPAE66ALG===="
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
