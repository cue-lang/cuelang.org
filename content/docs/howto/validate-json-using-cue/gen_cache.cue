package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "hnCH3aY8iaRwu/aoAON1F9EWDbTrL1n/7ufoXvJYNRE="
								"x.cue":        "5rqi/WyDMq2zIxEGm9rqJubs4iJNusJVcNa61g/+Jf4="
								"x.json v2":    "GtDy2Fk29dC+NGh2PQyB0G6mPtWpiMHDeK2LKRk3Klg="
								"fixed x.json": "QUNSmpE89Y3Hxky3ccMzTDXH+b4FhO//khMS7GBMiMU="
							}
							multi_step: {
								hash:       "KIGGGGHTURSGE721334MV2J2G8M6O8GDBJT245EPCMD2GN5FLUJ0===="
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
