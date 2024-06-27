package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "OuN60Yb4+yFjISSfNjU9fYxFWBGNsGPyN+ngUZ/WFHI="
								"x.cue":        "FbMY6JcfX/kUrh3ZNHK60ibRByQvvxAkBITq/6yOcS0="
								"x.json v2":    "TUZMIgfiJuN5zAm/d4oJM2qe7rGiJWnZZ71Evobe8J4="
								"fixed x.json": "4nkUdV2H6Nv4lxq8TdxT+2FpbIOw4U0MWGAlwiewXpA="
							}
							multi_step: {
								hash:       "IT4LH9UJOVGSQVHFJ5F3MP1IOCPGIIATHGIPCE05S0390OI6AD20===="
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
