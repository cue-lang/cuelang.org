package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "C+b5zOp19Xk64IossWi5UurnawxU9B75J1cxzt2R1KM="
								"2": "jK8Pl0ilkzgUJAoAOvSE9mqck6PZfquOYaU4S63E8Kc="
								"3": "Wifc/kNEyKAZydr1ZXMbrQxmrN9EdxzutPOnEf43w98="
								"4": "xDoX0DsFCM5l6lGP3DmP6fDrxulNHQQHXcEeXkCLf7E="
								"5": "wK2mww+Ul3/Z6uP+SLEkCnYQXarQrF6MkrGG8UncNwE="
								"6": "20YlSL6YOeo4Q2eDShuFvMUyqGp7TvX56J7Td9S1cq4="
							}
							multi_step: {
								hash:       "3FMLAFKHVMPUCH1K4OK21CF2KORHSKL6NEDLE0817IP96Q3E3FN0===="
								scriptHash: "FSA0I8OK9NEDVD22VOU707U926VUFSSTASVP4GE4BF61L38H8B40===="
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
