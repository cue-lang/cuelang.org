package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "yuiy+3xc7+kgkpjN4hQMnBUy+zlo1LOPgJ3bW+48csw="
								"2": "Ul/Pvmpmf/a0WrNwXtwd7zIctTfJeUb+oFBrXrGmfE4="
								"3": "gHk/6kOmL2Z+0kTB5feF+Rn6mF9n0pLzcYLhwx8HCvk="
								"4": "y8h1V8Yfa7Q7/kqecLg2XXjVwesqgaKKHim/68wOCSU="
								"5": "HLKSPMygseIv2JMQ+fpGHmaFx0zWRuG8jeEzwA2EHI0="
								"6": "K5DQ0rZ8BtM59yUUBfIxF6f40ohsgweviDQE+c+NqKE="
							}
							multi_step: {
								hash:       "RHLEM5R2E0M9T32QSN9IFVTURICK208LTOFK9Q4B1O3FAEPR3R8G===="
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
