package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "iXCKerDprKo8rrNqutLiL9N2E2EiLibbP9rds3BzzKU="
								"x.cue":        "Zcp2PiOdQ38Coq0o8hn7DS9PDo8xiD3193ziL/39c8c="
								"x.json v2":    "qmOmOaitWecmry5eEQXVBVeO7vSvtPByuAGkolRP0XY="
								"fixed x.json": "be5d9YGUXvWXKrOIMZXJwnT35CFBP+z1nMN0qUTt4hE="
							}
							multi_step: {
								hash:       "G57RRH3DTQSQC5B967DA9HIT1G61Q700AB7T8UQ81ABFMN0I9D1G===="
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
