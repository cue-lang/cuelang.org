package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "0gs9MyWinjxC6jYrgpF7nuUyClQ4eaGKGRaL1MnTUZI="
								"2": "Gb7p2CW1fuEQyO1Bx0IE+pWDaQ8bVS61cPrEClRmny8="
								"3": "XNrnSEnpT29pHTt/VSdjYqFw2JdICMJyp0sfPTS2o9s="
								"4": "lrqtXF5eyv1bU5UPX5fT9nv5eQca0xtWtrq8tsy4lPU="
								"5": "myvDGVxmXBvtM4ImOArzbqpRP1thv58wlywwH8Bh/kI="
								"6": "uyxEgaYW73u4oco0HDxVDQrlpf/Rp9g9+ZcPr71NgLo="
							}
							multi_step: {
								hash:       "0TMMUNRMRN3GN4Q1S0VV6OO4CELUFTQF8VBEGSAGVA0H1ACL0OP0===="
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
