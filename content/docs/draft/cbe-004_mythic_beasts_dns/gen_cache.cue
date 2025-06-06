package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "KLdPGA2/mxV7elZ/kWuAI1I5Z0MrxiQ+QdsEairqdls="
								"2": "I5SXWaLG1TGtt8vrfqcQzkKo3rIkfNfgwSSLuyQEvVA="
								"3": "2r33k2Rwbk1YMCF1CoMhs38KHCV0hdFu47+pLJscIaw="
								"4": "IyD75OcxfsxegpCSmKpcTfhquAjZPifELI4G7AV4bmU="
								"5": "RwDUxvOJuW9eizUkee16+nbBndOn4O46AtnB/Rpi7Hc="
								"6": "WkNhHXUaNukAYRgaNReeDALcmIb2V4+Mm9b0FYSa/pI="
							}
							multi_step: {
								hash:       "T3DTMPIS0H77H5QR1C1IG1FSU0AS15R8QARTTHPG9BRHA97322AG===="
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
