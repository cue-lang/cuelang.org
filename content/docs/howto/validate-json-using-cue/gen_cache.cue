package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "UXAD5ctBnq6MHaOkj5pk/pnpZrGe4f3Y9RngOStTzzU="
								"x.cue":        "euhprOH1BoFlcRfOjrQxfzZGUkvB30dEjWWYz0ddcuo="
								"x.json v2":    "7gmgLdm4CKvf1Pi70ypnZuMxaJpROuWIfJqM/TjWMVQ="
								"fixed x.json": "2CqaL3S7h7eSYrGETIuAdfYbK4XzJsWQBTnOBirgcsM="
							}
							multi_step: {
								hash:       "252UTL9VQHONIQPB1SH2RBNICOFO8HCNSOR3OD0RKMFFIFP90IVG===="
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
