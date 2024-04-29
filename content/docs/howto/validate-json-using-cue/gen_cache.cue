package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "PABSF82p7uR6433RETKKT0DzJTimCEWWnS33tr0PwcA="
								"x.cue":        "XgTUOmg6KVdl7jj9IsmAoTTgeoc/tOyv1BdNBiPZQdA="
								"x.json v2":    "cVFBimmX3I1FhNMTZbPFjCYAw/n3zBxf95lSAD21RKg="
								"fixed x.json": "1oy+ESSCRFs4gKS0zSM/t2HYPUj/z02CEGu7w2icTEU="
							}
							multi_step: {
								hash:       "R9KT2JERSA502RP111Q7URE3BK3N0MD8LMFPKGRIFBBE6VV4KEQ0===="
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
