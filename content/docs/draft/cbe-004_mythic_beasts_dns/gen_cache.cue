package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "IldNAZ7/39QaxPv200KVKS3WXs8n3hzO4Drr7cOnoRU="
								"2": "C/bmHO5zwZQNUq4VcyjEaRnJscLKkEynLoGgkayP02s="
								"3": "EH8v1yNNRrF8Z4iYfaC/ptsmAJ7t3g0wY3IRQrv1gbk="
								"4": "ZtVUIdX0mvvdxMWod79rUdE4p3SbwhJ0YUiEG+ljAbU="
								"5": "M3uzPlj9sMEPf63cHN/RA9RHVd4W+BW9Kp98KnTtHj4="
								"6": "cTb3F6cJyOP0EeSPDTedfyII555eRnglokkjMqekwEw="
							}
							multi_step: {
								hash:       "UV4DG7LQQKJIT62BPALHE5R39U8COEPUTHNH09CVKHRA2PI2PCGG===="
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
