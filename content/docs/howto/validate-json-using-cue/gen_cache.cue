package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "fKSJiYoDSQHNOX7kNkj2qxV9Y6UXRfUctEnqXxaXHLk="
								"x.cue":        "W+oIT7XIlnHxWEACTLDLlWMgb0hKwY/euh1yYOUq2Lc="
								"x.json v2":    "6P0v5BDNMFG8YQdBYT8VBbDJ3Vw0Gs6y0Lzy7BPBO+4="
								"fixed x.json": "/l7sbIuzDlVk+XAc4tD2/NrYncPjmt2Y9AbBKWrCWeU="
							}
							multi_step: {
								hash:       "PV29NNFL4P9LCMH8DQMJK88G1R9439Q4PS260ISKQ9N8SOD1S7C0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
