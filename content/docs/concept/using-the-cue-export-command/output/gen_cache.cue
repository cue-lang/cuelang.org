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
									"default output":             "PBBJgWSZAEcmDpXSp8Ut/xZYYXiCS906lbl07BzaPXc="
									"stdout yaml":                "CbF38XXSY7+M/ZVJaZejut9wZ+xhadEx4ZI2rNyehic="
									"yaml:-":                     "McU9nsLcTSI+3Oe3ocPNDT0ebXDmqPIM5sCe2KVtF80="
									"--out cue":                  "0CsY8HMEOFvTktmTyR0tZPPYk5IapOmuizUjfuh+anM="
									"--out cue no hidden fields": "1McLAoG1e4BmpAUmjaEdZNSUluMCrETMMvKI7AXA1Xs="
									"--out cue --package foo":    "FW88vL6gbxw0oSopv/HHiwb/R8bq7HG5jcpoWIKZMlM="
									"--escape":                   "X9J7wDgb8yQFQqPFvgajtQmQssgTcYW3kc7XEN4uXEM="
								}
								upload: {
									"--outfile data.yml":            "p9zFcHE9ZCVnNzsYSkVdswlJISLulsIyepl2hxoqAzw="
									"--outfile data.txt":            "PBYCUkObbFlqZ4wvUIPoF6EOpfzJONbe9szJOTigHuU="
									"--outfile datafile --out json": "xxGmRAG+f4tT+TLHK6r40auXEl4tulu+cHwKIel6k9Q="
									"--outfile json:datafile":       "a4FnFaLuCqma75dPQ/JyRC0XDEyKJgFe2/eTEFLtpFE="
								}
								multi_step: {
									hash:       "C0O18841IIOO21DE1HF31TP2SQ6814KM2QR8C35GT50GPST485R0===="
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
