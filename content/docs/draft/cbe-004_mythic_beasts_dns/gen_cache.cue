package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "PFn5oGWve4xYHVop9ikpr7FTVRYAVljLd9/qIgMVjPA="
								"2": "noQDhC8kNFyGn0j0eTDojdd85XQyOEDWCAEHzREbTGs="
								"3": "I2Tz5TNcsIFwLTEUsj/8bCBHH5n7MIuViJije1nR+rA="
								"4": "mZA9EOx+S1GpP9qzgkwx4QWHBRuCIMJSF3DX9JuF+ts="
								"5": "MoQVrKlgE4Pr+UQa6pxTVtD9irHyjMDfCIvGh6yFMWg="
								"6": "SGX33+cb1zQn0aWfgd6SOGYknOBTlyeH8/LAP/xhGLM="
							}
							multi_step: {
								hash:       "0CT4RMDGA6M5UJ02NA9C2BMI9T2K50IC5S0P1PNM93UGMTJV4AIG===="
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
