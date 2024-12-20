package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "DPYJLY5NprkNfP3aEsGyLmlHX7yYm0Nk8G8A0hXKoy4="
								"2": "XaK6u7pGKEtw59iIajf0ydhSajMrbl3zchDfG6TWmEo="
								"3": "gHC/LdoYS31Ad7D9li2dNCywcw9Q96xKSlI40NntnZI="
								"4": "cEwLDM2zD6cTcQAISxhsbkj1BT2O+Pag1XxYiLsLZWI="
								"5": "CuQLMQvNRjkU9LTXYT4u6OdV8S+lARk5KUJJ1EYxRCc="
								"6": "MtO08axFAfl8tO1qrVbew4k2D/3wzFxKGyxw91SMt/o="
							}
							multi_step: {
								hash:       "IPRBAVI1OF7GC5MHFS24H8N826INU01P93RTUPL8MFNSUJ5IK3N0===="
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
