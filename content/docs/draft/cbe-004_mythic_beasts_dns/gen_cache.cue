package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "0d5BW/LMLOA2QvI7v0xxiOQAyTkrsT7NPoPwTuXLAvk="
								"2": "MzDld/cdQR/3a/g7+MTrlhbPkUFkg17b1nbey+drmfQ="
								"3": "RjpS8C7rGhaAglkHM4hTTg11FcpIqQrSPa/6GHQNewk="
								"4": "7EYHloAMRwZTdCO0vyFziB36QbpFXLjUvylV/NBFzCs="
								"5": "PFiRm/fKCGryGOv4VC+k0PvloTRxsp8Rdg5g31ppC6E="
								"6": "aM+aHLsBWOEPN/PRD0an19r+6JTdNCZV2r+NMHU69/4="
							}
							multi_step: {
								hash:       "5JSQTB70RMVPLEEPAV7109A6P7MI9UFI7G7HQJ16P8FRS7M7G7BG===="
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
