package site
{
	content: {
		examples: {
			preprocessor: {
				page: {
					cache: {
						upload: {
							"file one":      "RKFmtsnUpFD+DrXAEU1H5gxQXWZfKGrxdHdq0HJIeMg="
							"file two":      "3WdkVLsx4E5YTSVvdwds/jybmHlU/JF0flzwdX5pF4o="
							"a hidden file": "IlgNozLzyFPq22OqB9eL+OYXkrBMxIcRp0UXZ2idxz8="
						}
						code: {
							"a code example": "/qwaKFVfyB6J6eHuFs3OqxzINKUms3FDIsRzRCRfcPA="
						}
						multi_step: {
							hash:       "75CEH80JGU1ER3DQG9BT4R6K87F7A671NTPQDSAIG3CUMDBEDAK0===="
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
