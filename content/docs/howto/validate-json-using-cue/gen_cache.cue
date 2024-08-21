package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "4tIlFXclHEHktUFpky0TslLW1YpWrGifAQFWv/3ye98="
								"x.cue":        "QNTxsfHVCPkz7P1QX0R3QjJ0GOFHFxmkodEQpYOEkpk="
								"x.json v2":    "jCoP7TQXnyt+cGTkHPk9V7bk8LkwPl/RxA0I59Vv9pA="
								"fixed x.json": "mlrdMDdFUo9hEFozHYslRLo2Ig5WgEbfKc+ibhbrTZY="
							}
							multi_step: {
								hash:       "C23HBQKM2TOL2IQ284JVSRI8AH10AGK08LJTBJTAKGEEQBED0E50===="
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
