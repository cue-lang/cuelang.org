package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "qMWmG5hz1/BoqBGFha+CmzxFhTRyQazhcaMKs/567yY="
								"x.cue":        "96yI92uUCr7lhWmc6ze6d26q71IRHs8ds4hB3NzCuhQ="
								"x.json v2":    "btvQkj8cIt33pHAun8wrDCaBU5TWzsf17TOZfAwLP6A="
								"fixed x.json": "f+fetA9hpJmyBMWP9AJwrR0Vb8cO0J3ZNDTxpJJdnWs="
							}
							multi_step: {
								hash:       "GEQ42JEQ53URMOP0KSVI2ITIHM3CKAMB8EUNMDGJT39G2OUTNLI0===="
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
