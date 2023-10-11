package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "KQvw17lIZHHSHiQugDVJ2z1I42tE9MWHr+rBgUClqXo="
								"initial x.cue":  "OxAP5xljscEsZT+0HW9+X4fMg2R2rx5VGKEzdGWD/W4="
								"another person": "qL6hwr6X5iD1cRJVoljUH4yNjnjAuISuqw9bdFrCezs="
								"fixed yaml":     "DvcGDQqx/uf0EZd28r2LaznAHz8NZP+RDQU9c8YftYE="
							}
							multi_step: {
								"IFNH4STHDNUIBQMT4KKVE1B29OCAIDIUCJONO06ALSQJC70JE240====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									cmd:      "cue vet x.cue x.yaml"
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
