package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "hr2Fxg2KJgcSMMqfhgJxSnHcIxz50fn6+MAH0iv/k1A="
								"x.cue":        "dVym3jhQIIK2vzhWLaKaFzDhMHejWcen9hEEqNsZ8dc="
								"x.json v2":    "oFCZcl/nCq7vRXXIMSKRd0U56NphHKIQSkYJzetIABA="
								"fixed x.json": "yC7hFMJLXWss0H5dcd/MEfMHUmTHpBTMKUuvF/+8yQA="
							}
							multi_step: {
								hash:       "N12JD5EMM3ADPOIT5MNBG11DNOJUQQ3BCO9MK3VJCGRS84745M4G===="
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
