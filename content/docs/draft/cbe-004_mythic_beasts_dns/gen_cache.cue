package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "t15oug86Df1DqQHme/QsRnl9Va9uo6fAPEuQAYQWme8="
								"2": "tjFLHZQbAaxFPcXu+sQT0aQG6Sy1sU93yi4YG4ynoBk="
								"3": "62iYEBDR+cbfG9TV3ffe7roLqO6jRlc5YlN8FPj/5bo="
								"4": "JB9Vtanm8pnpyrJPXKoHmz4p3z2YQ7zvmRrcSdL7cQo="
								"5": "ON1CFNJPF+C98awY3z3iiGlvpAYKlr/EvtCGw2hHb2A="
								"6": "FMhf6qXvqjZGxsEqNcZAiiIL73JAuXYWu3UALjJslYY="
							}
							multi_step: {
								hash:       "9E1VKAQOVNAIAJ0A4FHDEB10129HF77VBTCBP9DA17AUD9K275UG===="
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
