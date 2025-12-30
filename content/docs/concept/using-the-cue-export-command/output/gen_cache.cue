package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "QgThuQJsJtSy0k9rDh0W9JifjtkOwFXRoWRNqB9I7a8="
									"stdout yaml":                "ENPd+oWnv57pxw6/zaoPDhkYtZXl6dl1f/qH2iaa/3s="
									"yaml:-":                     "IcKNP0JV8/pnaIjLV6HNSMo+9TeVsFvGeRVUvoGTX6Y="
									"--out cue":                  "HmEpF0KYZV6VqOn6NBsPeZY6NKqQzGq0PqNsZVri2xk="
									"--out cue no hidden fields": "kO71xdfi5O6O1BPu/4wgMVmO5dxPEjnbebes2/1/Q+M="
									"--out cue --package foo":    "nQcVKukxBnTbc9ERZzT1K9/g7/907imL1yUb9rO3fCM="
									"--escape":                   "dCB/k73azb5mz5MJhVXgiHD4PKNSHs1zGixwET/Uj+A="
								}
								upload: {
									"--outfile data.yml":            "0uUhTugUNS2+kkJN2CZk2iqBPB1zQTtHzaib01BrYW0="
									"--outfile data.txt":            "Doh9Zk6cmzuDkoJdx8og0DVOrRV08KU9TJE5OYCmbpI="
									"--outfile datafile --out json": "dnsN3BSUcfDRsoWP11WJWnFY1QQlAqL0p/1EYN3Ejew="
									"--outfile json:datafile":       "E4ymTcHAHLFfx4xSVbC0qkiR27GCFzNnBVMCVJ0w5F0="
								}
								multi_step: {
									hash:       "DHG717IAMNG2T6HH2KB9LUNPA376RFVDUBFIKT53TUP7QMPKQH10===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
