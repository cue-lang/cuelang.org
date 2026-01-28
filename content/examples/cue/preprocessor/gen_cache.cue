package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "eoV/kSKejORTkxYTW38SXU9WSBlL4CVYfaVepSZ/rM0="
								"upload additional file": "u3KXHz2hWR8zawZcawxIloh/WaFLwnNhIsnW17pDCSg="
								"a hidden file":          "bJ4gRngky71iEWhtTh5Rvigx2MBl/X5m4yjdLfRqhdg="
							}
							code: {
								"a code example": "3509uSKn2vAUEEDrc6vne3HiyfLrUuLF3w3n5c7mDNQ="
							}
							multi_step: {
								hash:       "IQUSM10QD9OFFEN2U3UP1FNAJD6KK2AME82KDA99GFEGC4V2CDH0===="
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
