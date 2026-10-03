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
									"default output":             "nDWN/N/+5Q+dXFJDaKZCddb+gCNetrGo3nFB2reAINg="
									"stdout yaml":                "TZg8pfhkIATDMv9nura7kclGVs7DLBLCE8btbaw+x4U="
									"yaml:-":                     "znzmITX76SDJGlDDhRVDCzk+eNuW21ZXDS8qDDhT8wM="
									"--out cue":                  "xjaEjERW5jTH315gucmkArJwPa0CsqXNMmngeyeA0jM="
									"--out cue no hidden fields": "zw6g7BeTNaLccpXGJESA1of6+YwZf27DWgDPXz8rbJY="
									"--out cue --package foo":    "STT17ZbS+Gue/yiaIjG7RrSDHdPiPyVkhSxJ3a39TKM="
									"--escape":                   "iDHExabIJpsdM/puzhgmtsPlDFz5JDx3rIw1YxiFEbI="
								}
								upload: {
									"--outfile data.yml":            "XtnnytG8XL5YJiXvoDDOmPiOMWHdffptephqpuriH44="
									"--outfile data.txt":            "u5ngAVTqyEg4yl2t7Q65iXnFcXeLCunlrqH59BVJT+U="
									"--outfile datafile --out json": "5oYWOVtSa7qa++Nd/Gs+aH59tQU7PhVpdKiwcc/o19s="
									"--outfile json:datafile":       "jF3VUm/03WEnFtp1TehTtA5/gt8ZOS1sAs6JL37kC1U="
								}
								multi_step: {
									hash:       "GM64C4QNGKMSLRSIQSLNMR2I8T71LP4DNHDIVO5MI2E7N52EG1S0===="
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
