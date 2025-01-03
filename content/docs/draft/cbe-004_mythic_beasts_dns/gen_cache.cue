package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "eqZQDCyzP5oh0Qce7bmEknU/hta0EdUs6rKiUjooeDw="
								"2": "nLIxboz2CoLLuwBYU7PjujdcWTvl0yyZXrU/ju5FLYA="
								"3": "RBF4xNqn6e3XjfNYH74Nf+9ctV8cGDbQw5idDlM9i48="
								"4": "oTkjHTkONIaHeJet76yMDZY0GiaWladNBitEEshcxLY="
								"5": "78Idrk1GBUYTao2JBk1qxbE1mVXyPT1uNsOh+95AbXA="
								"6": "deQifyr045+7c68JaI1rX2NchC1SYZEDYytF3U9bvV0="
							}
							multi_step: {
								hash:       "K8SSNAKT2FM4TRBPAIU2DNUDE1CL6VFOF66R2EFTNB01PCR953O0===="
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
