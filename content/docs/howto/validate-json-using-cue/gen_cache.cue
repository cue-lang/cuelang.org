package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "nFrYsFRtfbKzoeE5KHQNn/NvOVmBXmKv2MOwFvTco7c="
								"x.cue":        "blzQuctucR3QpB6ST3H3f/13Hke5TDCiEZpnguCjVjU="
								"x.json v2":    "bIiyKBN2Vf59FkhBXCF3plJlO0n2fTx/DLspRVBvoV8="
								"fixed x.json": "vQKxtYET2MjtLgPY4+izFgEDqfE7Ozun36LnpjWeHdI="
							}
							multi_step: {
								hash:       "ADMBSNLI4SCFPNLABU7E7LV175AP1O8BCBLCVR3VEHT92E0OLNCG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
