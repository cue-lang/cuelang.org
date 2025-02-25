package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "EsUMUeihBpy1yDD/wkhMhRxW6w7aj97CsVcVxjWNvS4="
								"x.cue":        "DvumsApq+TAB2+nCadUWzm6SDfQiboFCIHTJe+rrZ5w="
								"x.json v2":    "KLbsbekWuaPJLBDMXK56NHHit/5MWZu7w2i9EBXNNp0="
								"fixed x.json": "lJroPiZzd9e61icGbeqm17213pEsO6HbYn94tEkJ+30="
							}
							multi_step: {
								hash:       "U3VQCKJ2LV5RJ06MOBND5KCSC5S78OV9UR8JCED5F2J9DDMAPF20===="
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
