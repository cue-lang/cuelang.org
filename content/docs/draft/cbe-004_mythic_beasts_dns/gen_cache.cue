package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "2xjlbjuPIJA4t7mZTcfF9HAQhS8h3C6RikI0IPYU2Is="
								"2": "Zn+d7l5+vMh7+tGbQ/C7jp9/Ds+8wVue+sjs4evfr7s="
								"3": "Gs0Q30G4PE9SIdpDNzJpyaXdtmJA5pWOXWRXfzobfdQ="
								"4": "Z3eRS5TWgCFGI9k8MpjuOUwTPgcA1SoASNyUV1uOzBQ="
								"5": "qZdsTN5PfPa5ZNv/tsSc9oALLh9m/+JRh+Q35McxTXc="
								"6": "bdBCgab+HL97k5EId3Thdj6bEJil1+I4SIEycn7hpx0="
							}
							multi_step: {
								hash:       "Q3QBUDO0OR5ESVG6A3P7KJ9CMRIH2BLGB1O7IGR3CFD9RMFU0QU0===="
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
