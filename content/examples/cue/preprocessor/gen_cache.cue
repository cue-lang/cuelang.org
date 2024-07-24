package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "3mfvzy+iwaCi2m3IGVPKpMdfc2TQo0Ueta/atokDsIU="
								"upload additional file": "vNRd4PYMxeKYKsZOJipRYnGEpBYMF6Nj88vNjyT+ies="
								"a hidden file":          "nRsTa78Lq6DsCKKPrQNurNxhDB3EtC+1aPsZ+nKol0U="
							}
							code: {
								"a code example": "Py0ngr/rtw/gJqRX9z2bN0KB+SqJ2nsNk2veGytTZTo="
							}
							multi_step: {
								hash:       "7J9QLF6J909NL7O62PL327TGQ9BHC4ONH38CGM8E7ISVJ3S1M6U0===="
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
