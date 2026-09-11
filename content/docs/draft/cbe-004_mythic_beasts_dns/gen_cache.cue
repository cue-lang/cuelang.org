package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "t0+lVw8TjYKSmVidErZnWf6nQ+Ed6iV8CKauKLH0gcc="
								"2": "FK6Y03NHpzFWoorejmz1KunrYYN29Ba+JL/mqAqqU3o="
								"3": "V2aiY2jW/7TNcGLguea9m7JzfYMRSCMihhnKmWKIYyY="
								"4": "po4QdeygYtuitEWonuYZt8QPGQm69xeGLtuLKECLiQI="
								"5": "NY3oY2Bus4s4tZYgg13pmKmJGAdRxnAkemqeDOFGqyM="
								"6": "qY9ImZEpVLXgQKVFtZ5r+PaPfgFbJa0rYn/yiJdKOao="
							}
							multi_step: {
								hash:       "KSACSHKCVNLRIS27MUPDM06FPMPF9R8AV0LF61H2EJSK64NBIAKG===="
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
