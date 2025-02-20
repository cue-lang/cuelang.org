package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "/FAUERZpzzJOFyLTWnhFaSB+gWehZ/9+qZasW5ysdvg="
								"x.cue":        "/g8YktTRL6eUr547MHO3GJzEdlIlozJ4pPZU4rSHbxs="
								"x.json v2":    "bNfYSaOSHbIBN7quYqdWfsTz7MQWeTXLRcdrAVqFeiI="
								"fixed x.json": "YWFwKgqarY+Mkws4v68blSh1U3Bd/QUVmvGz5HcKhnE="
							}
							multi_step: {
								hash:       "VU6JQH4M740OJ3U507UQSVV81HG89LKC3ADOHGR256GBUHR36SD0===="
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
