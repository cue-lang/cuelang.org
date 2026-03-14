package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "X/agnlaItVOjijh6DpFxk0MlHuPIIl/X8s9YmsymO+I="
								"2": "ixPWmEsLcBg69Ig8VhOx977kQ1nmBXzZDi9gwYsfovk="
								"3": "hK+v/x/h1X4lzkS01K8MJqNv5Ucxwy2LQkjVbTpjT8c="
								"4": "jNwY3NPxjaqPrSsEvsa3Fx0mnhvhVI2DPD5qLGVl/Gk="
								"5": "2i3z2R8UCuq6ZQqfP2myjBJD4Ld29rB7OTfKB0KtBFI="
								"6": "YQId+nkw3WZAHclpI2BJOBIphi2+ZZOI5kPhZXzEDSo="
							}
							multi_step: {
								hash:       "DJAKF4BEL0VU23OGHP9R64QDU3JEI9TI8L0E4S2UK5SIQBVVDIHG===="
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
