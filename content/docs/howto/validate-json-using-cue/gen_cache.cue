package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "FSUMUi/dsqS/AIVn3JyqFmuT9tdPXgfXLyDzkQzpNUs="
								"x.cue":        "RS0coOdoE4fUUJdov+8RqMJ3UlxoLnpXAVW3RlC2Tcw="
								"x.json v2":    "hbCJquiXML7SxlNGdSxRH0EcbKuS0QyF6M+b/srdgqA="
								"fixed x.json": "cL7XB9fZzsnEoYbv/Q4jU4xAB259ML0F6HIjNH0QIIg="
							}
							multi_step: {
								hash:       "7IPUADV00TIIU4G7JCNM5L9D8B6MVHRDO1PIE04GJF82N50ADAP0===="
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
