package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "lJZ8YjYljepgzLns5QGcECtHf1NpdKXyV7oEZ7bdF5Q="
								"x.cue":        "SjqqbMW6F/+UCnC8kf0CG4MKO+Sm/BvcpTsiN/DoeJU="
								"x.json v2":    "46kdNdNyCymWE7EnDwCkV7vobpIDRW0nIuQL70IXbUU="
								"fixed x.json": "FcFyIDnNbPP6fWQs43Y5PgsDfabzdcSyLcgEX79wg9k="
							}
							multi_step: {
								hash:       "RHM9ATM48CRH4J75HGL65O91L6F34AQFT8C28LVTHOQFCUL2NI00===="
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
