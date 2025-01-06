package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "NwdW6nv9yn27Agny2bICsYv/ToZssF6BZGE+lsyv8jE="
								"2": "7UjJOG85BUUFeZWyXfpc+DOJhONL7ND2vaBjuwA4Mw4="
								"3": "qW0SfuIDI36iJw89U1M5q1BC/Pcs0o7H+1AOoOgL6/E="
								"4": "Iv1TAib400chLlX7VYwii9ttXv8lDRJUyz0857H/nK8="
								"5": "ORMfdK4gvS4VfpPplkvYt2Po2xh0XaiGSAsOLZgX1Io="
								"6": "R2fbEv8/g3FZ1Bz3DlrRmQH1qMEYXcHXUL4goYWeKlw="
							}
							multi_step: {
								hash:       "8TL8PLQOK7SEBO0M182BH1N02F29VIBKLBV5E15KRA25F8H5MEAG===="
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
