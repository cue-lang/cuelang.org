package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "FPyyckkqguoOdKuoHFcPVIUjhxJ6NXdN7USXHSLk49U="
								"2": "nWre1OOkjXeNOYzQeP4SnffLB0Ep3kdtGJ3vdLDpeUw="
								"3": "mj7QhDG6ge64LaAiKdaYPVAKmlguBwmB03TFNHAVakQ="
								"4": "Zy9sQWTJemUoC23JomoTHKH2IXwjOUOwt5wwE8DFLj4="
								"5": "bPAwk36yoN0sKzAApG0Rjbl1BduWC9leMF72Ks3oMNM="
								"6": "6PgmYUAv36rVgohqnA7WKNh6j3Hmfc5pDNtDtKzRSlU="
							}
							multi_step: {
								hash:       "M99FEA0VNP7CF0E518P7JHIDEN1FRKJ7TMCSAOKJRF4I84J1FE70===="
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
