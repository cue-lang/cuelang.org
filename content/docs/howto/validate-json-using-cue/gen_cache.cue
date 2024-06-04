package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "K/ZTCIKrMlswOvi9FTzoRJE/hFnPP4OST9ubrtFy1dE="
								"x.cue":        "qy4hw5UYc6UaH7Ml4/hEJ3ocNeCOBqdik9dgFHospxc="
								"x.json v2":    "1e6Ta19PPvnbYGvnPN0F1OvPrC9jiS2XDUxl5bfP70g="
								"fixed x.json": "mAjp9TxkR9V27Dyv/SsKj2IkfGswwtCFDEzLpE/uD4A="
							}
							multi_step: {
								hash:       "43DHFQN0N81TVDK7MC38DAPOP6ET78D9MV58328T0SVKR14AHD60===="
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
