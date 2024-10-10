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
									"default output":             "E2xhZRMC25BxPSsnWtAE3R8np0IrJ9htGWokMrQus00="
									"stdout yaml":                "aqeRDpHWziTLIygtRLPdCPi4txwkNNUw/KsOM81EmLw="
									"yaml:-":                     "vtyUq8eP2usaZxHWkeGgY9ql45qto9ngnSZoqu3DjNw="
									"--out cue":                  "nGbGDH4jKZVvIiDJ//badRtmKWkILVv0AoT33kkW8UQ="
									"--out cue no hidden fields": "nf6oVkXOKsj83G0tu0+zOLzBMpMwfGlVDyrBIt08ZMs="
									"--out cue --package foo":    "gSRd/f5ogy/DMxBfK1oDUxqPS9nxlttpujiSkUcEgvI="
									"--escape":                   "W+u7uUZK57zSNG0zZcXTOfJuR7WnpETWAOuqxd3yTZY="
								}
								upload: {
									"--outfile data.yml":            "lW5k6RBWWagRqP0VAehybkwk1NLqx2l6YbY7/U9xN1c="
									"--outfile data.txt":            "LNhngWQOTcWcJnS7Ys3+pIpL79igjxlETDKb4RKwn3k="
									"--outfile datafile --out json": "f7rqB4TUwaHGUbvwQ+nUrNhWrrn+yfEfzE/SD0Bgw+Y="
									"--outfile json:datafile":       "fIFx77iL96UJzp9uS2V0ETHQuk0dZqALKBbSktZ+Ftk="
								}
								multi_step: {
									hash:       "JVNVUM2R58QB39C5U2ALKRDLVNSTE0ETBACBA2LB77AN5IQ6KCAG===="
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
