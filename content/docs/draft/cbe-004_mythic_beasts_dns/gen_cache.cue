package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Rrfri/Rsbnv87CunwmNRgIBEB/Nd6zVCjAAqaepC9sA="
								"2": "ROk2W9HWHgUQ5IYo+/9XN8Msk+p1LtPATTbvrB4OgVE="
								"3": "kbX+92H9p5Qg2DGGmOkdKqx7IvN15ijF7QsNfve6p6M="
								"4": "CcYBopU4OmpSrMM+KhsWYxtt+f2yHbIuWIRDXXk3BTQ="
								"5": "BhdBpNKB8VjjOmtjNjJwkLUFOFo2YP0HXaJDK9fO91Q="
								"6": "Rji3csBK87rCAWZQC8rg9m4aSDeglKOoYBi5iAApS5o="
							}
							multi_step: {
								hash:       "Q5C0TH84IRLQL4HCI5RBGP679U8DTT934KVKTPPRS6DR9SSTE7P0===="
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
