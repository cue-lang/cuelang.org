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
									"default output":             "S1W1n7y4u+hxxyY8EomZVLTwirQH8gflfOMVL3PaOHE="
									"stdout yaml":                "ZsLvT51Bn+KHKhbuJmTfY+jCgSpQaLDOPENMFK+WvD4="
									"yaml:-":                     "VaLQ92m3zGW+96oKL9EBXNISpSfYHf2+W1b0jruSFYs="
									"--out cue":                  "Bktb4Bbt5TKz+FkTDlAJ3Gg37Nrcgj5/OHQdAMfoYLY="
									"--out cue no hidden fields": "wuBzcGKwif+NheEuSvuwJ2z/olJ9uj8sWo9szHysumU="
									"--out cue --package foo":    "Lqc6F9F+U3tpuAx/MGFaFzPJ6bIZTqYcQB8kP3jMlGE="
									"--escape":                   "DwSNzs8ngfqTe8/HYIdLZN42uSU7wbCmGTJHZT4rGDo="
								}
								upload: {
									"--outfile data.yml":            "X//yA6loa6EOagitv/v6LctZHj+7EJgVDnTXyfGCn5c="
									"--outfile data.txt":            "bISdTQHuUgtu0rW3BY9/b14dacswGXNM05bL1hpSSzw="
									"--outfile datafile --out json": "7sw5ycev2f5fdwaIW7NARIb7nsyJNp+nveVgb53ihh0="
									"--outfile json:datafile":       "T667KDBVXDimaBry9swPYuipcgTUdN+ebFE16v2Envs="
								}
								multi_step: {
									hash:       "GLO0H9IU7499O7R3E9SDMK0KEDC8F68EK9Q48O4GJ7OATH9GDCUG===="
									scriptHash: "L3L2DKT4LCBOMUFUINT11UNJ16TU1DRUIO6VISUNUVFMT2O7KFM0===="
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
