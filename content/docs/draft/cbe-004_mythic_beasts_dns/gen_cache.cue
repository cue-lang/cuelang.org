package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "EWq27EatpJjQpuG9A8uDU06ac2iCiGqvN6XJX5jcZWc="
								"2": "sTMv1+g/hZeghzStm2DR+OlABEYuoe3vZdvZ97HIzDk="
								"3": "zuG5uQ0wGIC+bzqJEqkEjeJOJcKNlhL61bzj5kHQe/E="
								"4": "XANqMkxKiPJZHLV1Mhshz2VMBPDVMIMwoEp8F5tIF20="
								"5": "ZLuVYHIGo+9epkl2Uw2P/b1H69J95OE+qRqpH/attT8="
								"6": "QKoZA6F+V27sQFdtc0z1LiyvDg/rmIwSiitcC5IXzzI="
							}
							multi_step: {
								hash:       "UKDIHK6BB1234M4HPADV9L762G16HO1BRTTBI5AKJA5CQ12R54M0===="
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
