package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "AMlXDFprFVPgQnTQLDTvENfXffUjpWwBokUrKe+gcDI="
								"2": "nm6JLJt9RZRp04VH4wz+ZuVi1RDToG18xDLpCajLMnM="
								"3": "US22+sITqfj2peh4i9RdDwUG2etH+LpFT6zZlU9eU1M="
								"4": "GIikdz9uiu3AKlrTuXq8ZkagME5ZTjoGGfmpV1Gb6N4="
								"5": "wFjqY5IErexboFxCEPH99rpJvv5tJBZMwDw1JgXdUkc="
								"6": "lUqb1eTADonKTosbf43Wi5pUdngQy/LT8Gqc4LFcKN0="
							}
							multi_step: {
								hash:       "OHQLVL6VRQO12JGHROJKTFT4A7OA22CSDF01IO8IVOT8AO984F7G===="
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
