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
									"default output":             "zW4gXhrIZpMrOShRPWQFtu6mGWUso7QRZX7M082tnsc="
									"stdout yaml":                "PqcUmflXykW3JuUCUETT66geUgPbTNXP2d72h31lpew="
									"yaml:-":                     "io6AofWnhMdzEp03nP2WayKpenxYGIHhsv01VN8eHNk="
									"--out cue":                  "iI7uv+Hs2kG/CxU4rOEMUiQldCmKK0802mJtEFC1xDo="
									"--out cue no hidden fields": "vVleZ9U3ajr/1XWmj4reg/frRnQtF1Etty5v5ZxshA0="
									"--out cue --package foo":    "P0Vk7XUGms5WjerKC9BvqUcMwdYFTx7p4Jc+QCWh5a4="
									"--escape":                   "W/xm3ll30A1PX3/MojCZPnsMygeG9JwgkZALmU0URik="
								}
								upload: {
									"--outfile data.yml":            "F4v82QQ87KWfYr4rQPKGCBv/03WOgPHbfAxB94fNPAU="
									"--outfile data.txt":            "Zh7oUJPrgfE0sVrjseAhhaz4LvBcalxfWcmPSsjvXJQ="
									"--outfile datafile --out json": "j42sEsx/pU9tYbXeAOWshVm02hd1xmRWlcwCvyN0R3g="
									"--outfile json:datafile":       "Lz/ObSoaYB+9QyT+BleLRMerqkttaXU84TuQY7PD8sw="
								}
								multi_step: {
									hash:       "NQ87KFQAFGNQ7CMB826SK50860B9GD5917BFRA6FPLELKIFG9NMG===="
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
