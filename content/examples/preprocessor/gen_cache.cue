package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"upload initial files":   "CzTbWZB9ZjBnmOn5v+izUhQnytQDlE3MoKSEtPioPgE="
							"upload additional file": "ticzyogYIfCJLcr2RXv4IBL4MB7MtmE18O02VpPaEwU="
							"a hidden file":          "kvzhIl5TTXo5kjthHoa7HcEELKPlIjGHdocti0WDujg="
						}
						code: {
							"a code example": "EFVLfvzZdiAQGjP0sI8MFNCN1ebzaj9ULX1v9RRITxM="
						}
						multi_step: {
							hash:       "1PVIF9FL96FUPPVBVOTFJHPU8T3KK1S4O314MJ2PD5MPGMLPT7BG===="
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
