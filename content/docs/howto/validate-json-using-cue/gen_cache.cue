package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "FKxXO57Y7PLj2/BryGO0AyRb42ICAj/Wi1td11K7Bxs="
								"x.cue":        "wk62c0rtV5OSM3rCV8VjZ2eQEceMsLqTNQG7eiJwnGM="
								"x.json v2":    "+YbPRHR6v/8FbqO1YclRfgH0Amqtd+qRX27VTfAEmzk="
								"fixed x.json": "VsmUueJHdCAXxiStWMFdl2lU5Q/elpOHQYPywppvMKQ="
							}
							multi_step: {
								hash:       "4A2E56436JRIGBIE2LSHON9DV36FL5Q15621652C50KHLDGGVTHG===="
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
