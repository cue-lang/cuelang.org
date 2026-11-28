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
									"default output":             "t+AjKHDqyMU7Ch8dQOFouBIjnhNzfVN8CuII+2n5U20="
									"stdout yaml":                "n98vbME24gPEihCEddrmjG+hwZYMUvOcQI3azHgZrWc="
									"yaml:-":                     "QgNX5DLutlGOwQpaWhOkJAi3AAHvPwRup9nm87wR2mQ="
									"--out cue":                  "tTr9RqkrPURzUhF3SW8O7Hlb61ClDbr573oCIdt05TY="
									"--out cue no hidden fields": "tXRwDHrtSjces0oaERUxOlm6ODiQHEJNXwUPpmaEIa8="
									"--out cue --package foo":    "NRC4Og6oMTNu0FUkALcLWbbcrMYWUC74VXlOy6zhCnI="
									"--escape":                   "TenO+CI2HRTtS5eXQsDEtMfiTPIAb0tmllPiOwN85vQ="
								}
								upload: {
									"--outfile data.yml":            "lWPegdw2PFl74XVMVD1Co9IjeN959dojOBueC2XjXGc="
									"--outfile data.txt":            "xCAeAy6DjV+gses43OKVymOQDbaa90p1O+AgVuQXeXc="
									"--outfile datafile --out json": "8HB2wisALGTTLeM8ad7SkTtjK+OGenZtAnvmHu3hI5M="
									"--outfile json:datafile":       "6vu2wtMboPZLKiwuumyQuk0/t3d3n4WbUd3WTw/X8GY="
								}
								multi_step: {
									hash:       "550PRE88RPQAJ4PNQKCMJGCSNS1M2IS70JBIFU1QGBCF81M0I1TG===="
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
