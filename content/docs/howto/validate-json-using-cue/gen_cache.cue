package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "Lo1xsP5lqZhGteITct0VIPZWaiRQyVHhZGirc2d84FU="
								"x.cue":        "e1c5JeVv4OFGmoZZ9+F31WUAZ4IhoOJ6GXf8mqZRPWM="
								"x.json v2":    "fb8bpFS9ysOAQmuFgNefwg++oxq5qowz09j8c5p83/M="
								"fixed x.json": "Xc5gT6vF8R1lS99SE8ylTMFgeAb+p3AySmvIiAPcsPM="
							}
							multi_step: {
								hash:       "JU8ANKELM7GOM60MD71FMA8AGFHFNNF49QEPFS543KOOT9ADSA50===="
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
