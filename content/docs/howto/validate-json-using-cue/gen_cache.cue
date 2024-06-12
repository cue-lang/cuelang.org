package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "MNTt5RYJQKtXcwk7XNTuaPybZ63Pj4z9gXmTXshAd7Q="
								"x.cue":        "rMUXQbQXvbiQG1tBN2yhJzaNnerlxnPYYqXuK6Woi+c="
								"x.json v2":    "oT84iBk3d3QRGooXkLcvZVEUEoRqegTcP40OLEpYPNM="
								"fixed x.json": "hlY5wUZ0RIhJVzzF7gwkJyoesw9fwFRP8ol5KkKaPAg="
							}
							multi_step: {
								hash:       "S33U2NOTULN57TGF9659HABH8N8A6KUDULSVSND8DPHNIAGMRN5G===="
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
