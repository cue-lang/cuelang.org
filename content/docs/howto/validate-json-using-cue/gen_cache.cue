package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "eR4TrJVJGbmDXHDlIpAMIZRkIzoQyR258xa+DTR6s8w="
								"x.cue":        "3YK1quD+pirffGghqye3D3kdGN/0bl3nK4W5A1qKHgc="
								"x.json v2":    "y9Rdky2gnILIT11qTdDsGiFAEbUaFOomOeXH1LQIxio="
								"fixed x.json": "A4eTMIpTJgM1PpzFfzeaRDiE2GZ/Yo0bm2oJjuPUwEM="
							}
							multi_step: {
								hash:       "616D3FC7VROSSRSQGP7KGBC27FQAJ136IBLGOMAD0R3OKVU1R150===="
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
