package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "eptA0sWEbuy31uiVzXFstr3k1tqaUERxYf0GzviPbXk="
								"x.cue":        "SlQWMWMp87H+q4+fsc/X+L4bhsbkA9Gcb5NheWot3jk="
								"x.json v2":    "scTdJGK1j21QIx8zY+BU0aqT8PAGGNU2NET9a1KhZ/c="
								"fixed x.json": "PRE0UpxjaBEASn+NcofdYRxTNo/GzwxpdBLMyI5yDCE="
							}
							multi_step: {
								hash:       "F4KDNOP8KH0PFUERFQP0BLT8SV2CPGCDMEKJQR9VSHGGJT464T30===="
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
