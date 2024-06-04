package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "GZuQgfDbhVuR06s1bU6fpCFUeIOSqYnfIevoqLMd1Bo="
							"file two":      "WNJvNl/eCd36HxcurEYO9yZ5jtQFvMPo5ipebl1BoUk="
							"a hidden file": "tsDXe/Jq0LxtnSc6GoWp2lNRVEebMVc776GQw2HvHkY="
						}
						code: {
							"a code example": "mh3M/VLT8xMMHQT/00W4yyBZZ34W4NXMjvc9a0SVpSM="
						}
						multi_step: {
							hash:       "0CVLSDM1J6U83RJKI10BLG0EAPMJ1PGLTDEPB4KTSC3ONFP8HJTG===="
							scriptHash: "E5NI97NUHDU688HAUL4HNFJ9D89OK3NMLI3HQ5QRFJ58GTDJ6GAG===="
							steps: [{
								doc:      ""
								cmd:      "cue eval"
								exitCode: 0
								output: """
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
