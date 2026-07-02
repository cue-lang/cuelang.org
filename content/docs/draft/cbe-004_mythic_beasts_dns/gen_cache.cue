package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "XSncPdCo+RWEEvtjVp/ZR8sKjD8y9aPESsGynk7JzQs="
								"2": "pIADTVc58q4G9yZyW1G0dMp3/kBREMz0mYBTQrL36js="
								"3": "CftwTcY75yzsS/qRlH15YyFDaPpXdHaTUkaDPb8lfZY="
								"4": "ab6T01KDWtedUiup81J38mlnSsKohHkuRAgqJIyR3uU="
								"5": "GNGSPptXYyYVZXkT1xACyUZ55sxG7nDGLXyMTczBcBU="
								"6": "tFqmR3t5i69rvoGU13+GspyTaZ9sagPS3hEU7IB7ldM="
							}
							multi_step: {
								hash:       "S5TAEVNR3EET4BIUL1DTBAH0TLODSN6CB0CPC9H2HGRRR8DF1AJG===="
								scriptHash: "UTSAE6HDD2M2L91EFMEGQHFKMTL2H6TIE63ANL6H60VA2JMMVB10===="
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
