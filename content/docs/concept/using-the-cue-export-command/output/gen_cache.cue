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
									"default output":             "Zojr3aGOgHJOz9WUwNYJwi8mpDkXWcpzB+skbhTfGqo="
									"stdout yaml":                "SkhQfW8oNjkYDo5BQfCoszxWiBH8iCGAvWEKi3MXOBI="
									"yaml:-":                     "J+Ojro5ZLK7dW+R0kbKV0UWFsOVBIO1muRfPg7P8hu8="
									"--out cue":                  "HNAzDyAdCmDt4vn4RIQdiYCJYVuTq24cQ9GPJbgvp9Y="
									"--out cue no hidden fields": "fw2T0942Va/N4JzO/33zZJvbZQUcG8Ih8OSI/UVK0NQ="
									"--out cue --package foo":    "l2YfEIApla8x7u7a9BmBLRubxEzqG0gEQ/VjsHhhYus="
									"--escape":                   "QTvosFzzgc2mCu0ATGDjeSB+4Uy2lccasLhGWGnI1Io="
								}
								upload: {
									"--outfile data.yml":            "yZLaWfZ27jqz98VwPd2oR0wyJ1Hq2lfIEBjBKhSw8qo="
									"--outfile data.txt":            "M1yUDGt4drE/4vl3RzzTA4jrgge68x738tgv3VXdy5Y="
									"--outfile datafile --out json": "H0iklb31tbO8J3BUHp3gOA+iCXqQylaMyT3Vc9sgxSw="
									"--outfile json:datafile":       "LrRzMWqlPVqq9xJEJYJXeIvob6cXkDxsw4OoGA/WdF0="
								}
								multi_step: {
									hash:       "2RIBV6N7N1EQQCNO2BSBS01THCRIV06GK9SRASFB6OF362PF94LG===="
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
