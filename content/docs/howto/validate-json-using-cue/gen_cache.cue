package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "ifKWY+OHFl8JF417U2CYrMDBYw4IZ+p4G0JTYEjakSw="
								"x.cue":        "SZC5kNfTLA7Yc2Dkfc72x9jOCfDaHY4HTOCZ1NdoRvg="
								"x.json v2":    "fYrvvclZ505RuQPDFcu5NPb0mYX9WCZxhlAEeuc8imw="
								"fixed x.json": "kw6zF65kYd0ndIqjwNduUPSSzjEzN4o3If9JYuL6Jc0="
							}
							multi_step: {
								hash:       "UPK9T67HIDQ0QCS23CC38C3JHJ7687R7K3AG6M1C8H7SROJIDOU0===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
