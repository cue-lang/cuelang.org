package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "yACgvEtcyvBZRzoffG8O5WewEx9bvsABM22DKF0L+l0="
								"x.cue":        "PwU6qZksmqcWh5dXb05TiA92oerl1sZ6Ko80enVrNEg="
								"x.json v2":    "J+3kZsN7sEFwiOHX7ZLD3oJN3EYTKq7vXF+sm9KLjQ8="
								"fixed x.json": "1QiZGAmQoyfOWrf3SgX91lhiZ7tTsc2R5phS6Bbvvbs="
							}
							multi_step: {
								hash:       "25N6O2ENJFUA2LM74J64J8GN6PJEHD0AL1TQEA771FTKH6NTT5GG===="
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
