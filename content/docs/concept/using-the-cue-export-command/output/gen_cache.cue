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
									"default output":             "s0B+aNhYmP2vvWG9ybtgftFtQAXD2DzHLILvOT3JLjA="
									"stdout yaml":                "L8iOgJdQLqVU2lVMbBPXVr9ugRvHcYQw5/qVSLT2tj0="
									"yaml:-":                     "IXfGcuxj1g2P3S0r/f1BNIRGpBEaXSsJORnsMfO4qWg="
									"--out cue":                  "9w9uegLNnGQ9KGpf2Jk175Xl9AS8Y9u68vI9Oi6yWjU="
									"--out cue no hidden fields": "Q3fLWRCb5ndbIcz5zN7mnIt/rCI/T+F0ya8XW0UqJgM="
									"--out cue --package foo":    "cYbuOriDyvntq3vnMuNxlYV3EkZUXSRMtF1NsgdhBwQ="
									"--escape":                   "xxuWafmEkdxw/UDcP8hafGlhAmql6haestbheebxju8="
								}
								upload: {
									"--outfile data.yml":            "tqME2ErfrbYPGL7cg0DPIjy1mqIU7onL2Xvf23LMlms="
									"--outfile data.txt":            "bFyqe/ZmjVBdE+vXiPZ2e1/dVQPMkZ6ejwvYJD7hlMo="
									"--outfile datafile --out json": "eXASagB2Tx0xFy4gmoDl7S/bCzuuenbQr5rWEz4sBVY="
									"--outfile json:datafile":       "PfY9GekKq6Pkei5ptW6QzDxjn5bh+7D4AMBc1km0CUc="
								}
								multi_step: {
									hash:       "D72SFTAPE82N7V5ELB55LTH9OO956D3AINQRBSURSQND0GOO7APG===="
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
