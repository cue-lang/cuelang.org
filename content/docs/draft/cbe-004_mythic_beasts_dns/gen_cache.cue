package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "MtAKh/ieRHNLfbi5vdoaw1TRHa2ddpo2rvFTZ9ALoRQ="
								"2": "FEygFs7sCuyJLAMfBLCFM4HTRPXBV1XqKIPsGhVPIlg="
								"3": "ZqhK6+vCaCshd4TSat0HURygpWmrBEs9T+jG+BL+I6Y="
								"4": "+JNuNb0v2/XWNl1BBCSixKLCMJpwozH2tatYXlh8+yQ="
								"5": "Z6wfrQMW0uYAB0GFCXJdZtSRk7fjh7nQ//aobrqAgJo="
								"6": "Gwyi4t27RYyUDBrw/bQBQRwTyCThyfbz6mwMOR8Kw6M="
							}
							multi_step: {
								hash:       "VOIUGDN6IFAGU38HL9G4M2OLAJ1V7PCDHNUHHJRU9CG0U587P400===="
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
