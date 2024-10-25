package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "7+B1Dfvn2McPruW/oYYPX/Gzqhp0Sp4HgNMYferI/24="
								"x.cue":        "e/86QS11cVZ5pArZJffRXKP3012bh2xDzzAiD3zmirc="
								"x.json v2":    "4fEsHSPWQUGOGbuo8gNT3WnjXMWBNntZWu0pugDnqC8="
								"fixed x.json": "T8Ln3BVZA91tIQUkUFEQTJQOhIevG6N1hTFFoXK+PZU="
							}
							multi_step: {
								hash:       "AUH1G5OT3V6VKN5NSI4148BHBUM08AQN0V8O0LEBNM9JJ2B5RV9G===="
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
