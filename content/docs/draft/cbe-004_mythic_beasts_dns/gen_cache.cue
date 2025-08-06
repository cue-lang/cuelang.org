package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "QRACmx5pK9ssKq85h/U3MIeeLPuYpXZP8kSJn8Ow6GA="
								"2": "nZGVNMgkmrV+0fWF0v1+nXzYT5xqjB+C0hVT1VljqXU="
								"3": "LT1/jb8Dz44Pk6pXMUKW7B0EhlhM6RVij38Noobd/6I="
								"4": "Bdo3K+2b0GAEd5U9/9qxVq/cmJs8wPt/Wp1lLdaBUHw="
								"5": "4ncZ9RL6lcHygnLA/dhx+VGqS5q3DxAReuFIjtt6PGY="
								"6": "LcdZpOHAYnHOs71ZvOVcULyF2OUPuTf8AVyo62Uhjew="
							}
							multi_step: {
								hash:       "QIQF7IJ283D0P3GVQ0M0I0BL9K1HLQUFRE8490EJ5PILIP5343MG===="
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
