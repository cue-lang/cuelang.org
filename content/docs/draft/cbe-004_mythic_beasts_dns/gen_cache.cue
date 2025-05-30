package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "oZjagCXVfnPOb3SZ33bypVQhB2exMCXW8izzEJsVloM="
								"2": "hVi7hif4mCZisgtdLKmTayakuM7ytoQ+dWrFF2sGmjI="
								"3": "OXjFBXQp6/m1hmW0n6Iz+SLO7oWXjFzg48fAD3+9bsg="
								"4": "HgF88M5kNlfy/rnlSFI1G3/oWxcNVXu7Y8hMx1gSo4U="
								"5": "uGtfLHTFBePMwexj/ApdASnwJg2NDOiBMD53jkWN5RU="
								"6": "iJXbAN2cElIs8CIp1svouvWlfUxK+4xt4mTffF/+k7o="
							}
							multi_step: {
								hash:       "ARRM8B18F8SGA46ORV4QUOMF31KQ909SRA72KVAPFFIU33IPQ1GG===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
