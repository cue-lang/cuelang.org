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
									"default output":             "6FOY0E1md4LH77u8J4Y/ti+j/qrA+GTMGPB5528B1gI="
									"stdout yaml":                "VtbRR3GGU/vNKrCHyBCkFae+3JPwmrOPQEhpUY4igVw="
									"yaml:-":                     "3P8GS+rEGCHub0lX/XFss3qoHTUlFmsX3vUBxXbaEh0="
									"--out cue":                  "3gZN4BsGSeiQkr1O55lPK2rn7/Grt26J6bWuSjt+1cs="
									"--out cue no hidden fields": "5e6phjHPDOAXkJBrVfiA3yMuNmcarfLXnSJ3H7zp99I="
									"--out cue --package foo":    "JIbE8zTkg7p5Gf/bv27/UY0DzV7DOc8CjD3I2PJPd5k="
									"--escape":                   "C2WPi/uEpBAK9yOi6yIFbnVpkD+MIjvxSYmWTJY9pas="
								}
								upload: {
									"--outfile data.yml":            "OYP6z3HowLuWnttgCspxWodQpsumgiOLnVu4YwYSbME="
									"--outfile data.txt":            "PLrX9Fo469FhAGjVMPaZN7duP+/1/1WVuU7f44ruuJQ="
									"--outfile datafile --out json": "L4kthj4rGFD/EsQLWwsOmw3GBc5jb11Myy9fOCsCye0="
									"--outfile json:datafile":       "NolTVYHnZLQS/kX0yeeUwIrf4AaUPR2OXqd+SwtF4PI="
								}
								multi_step: {
									hash:       "QFGQD4EO74F1BM32IP4FSLA49I66SDK18KHM3UQRBVB9F3MHM1FG===="
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
