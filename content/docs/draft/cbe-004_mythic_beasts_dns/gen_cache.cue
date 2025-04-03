package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "yQXDa1wkASD+fU3ppLEa6jMVjtM8dmcnyaHIV0Qp0GU="
								"2": "fXEo6go1Se979RvNV0Pwxi1402M3oGoCG2yDfsB21zw="
								"3": "PiNlqX7BbfdqkuHW6BaKRBp5pOUGXOwm5F475+LSxJM="
								"4": "KrIVIEfEN4rGsjXWxUgnsAb5stQGNmDdgxIte3ZuUx8="
								"5": "eHTR4sY4K058E8a2H648ioluDjFaU+iBaeAhEOcQJsc="
								"6": "4VrG8Qqxp9Ey9D1L30cDc7OBy97Huj9751enPVvoXxc="
							}
							multi_step: {
								hash:       "59B0RTD0DJ5OLG3FO3CGE2CC9TGCUBSQAD34L011ENSI2O4M4CTG===="
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
