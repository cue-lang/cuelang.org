package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "r/QVPAGaS8kBhnbebyRcI+2QqBn8DJa+q6ItIXsqSTw="
								"2": "pm91RXzGrZFT6Gz04sVresOQ7j2UVIpAXYbBFWopUJU="
								"3": "mMp21a8RJX2EX12HLHoodIZ4OoOUmYJDLvZ4dMC02jc="
								"4": "2RXTVbQXZtSA1bhlqN+sc+AAtbfyHCijENXfxKZ+rE0="
								"5": "jTbzdgkRc2WJWTfN5PKxeOHEHj6v1QDsj3wq3Ys6yPo="
								"6": "sY3d3W5cjeNc2uPtmHkoaGOdsWu1nxXbMftu6ym9WMY="
							}
							multi_step: {
								hash:       "65V0D38P7P6TC733SI24FGFCAG5N3C2VG5IOPTKBUUR52QKMP0MG===="
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
