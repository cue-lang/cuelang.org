package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "4ngNyYiAT2pZFv2yPtFa3xBK3D0VlgYQ3GRG9xF7iV0="
								"2": "rhuH7faYr89d4T8nmxsiFOE4zbzm5ZPsy3kWYrKZgGI="
								"3": "dqekhWaE8p5ikAleYUd+bLE1WAhb0fD9gYWCH5HLYlM="
								"4": "rDpbIHrH2x6GwwZ5m0eJbu3aaX1UIuMJGyKjyT6e31o="
								"5": "azUCWckO22BO1Z+BGYi2vLAgtftDcxf+yigKwomsXdk="
								"6": "EF/l93/eGTD0R0G8GOgtODVC2B/vHB1VcyTBTvuDMjs="
							}
							multi_step: {
								hash:       "ONTM38CAHSGS92FNE7DEIDFSF6GQ96FA576RGA66UQFULIBPDJGG===="
								scriptHash: "TBSD7E08FTER7Q7L3RJVPMEI6TPH95PCHEEJ47GV2E8D69I7L7DG===="
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
