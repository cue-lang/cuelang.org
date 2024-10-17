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
									"default output":             "FRuD237i7zvq9vyVUj9EgxFNG9cFiOsaCvWJX5PZaKg="
									"stdout yaml":                "mQXJYR2MetYaBQeeBWVf/zsN0P/uci5LfqEZAl98l1c="
									"yaml:-":                     "ZUtzIMDgY7IWPpaEzlTgWfZFdMf8I/Wg0iZ9Fw16Vgk="
									"--out cue":                  "vE5a4+NoK4wRGLIuqUnpe2/M7TuV5gdjyKAXb/Y2Rjs="
									"--out cue no hidden fields": "l3u2vEQyOPRH533t5EEaHMhq2c1MG6fnMb/l8/f4HrA="
									"--out cue --package foo":    "X8E2hc7UzA7Tq7SRLAw7HYPpc82fi0tE09eBqBh39BE="
									"--escape":                   "ZucKEhbuLkXzRpK1t0xIv3GnrdVz2ZGOCutYdze8v4A="
								}
								upload: {
									"--outfile data.yml":            "H2bwFt1+nAFBCI++vB+b5eBaEjazJncy62umbkdxaas="
									"--outfile data.txt":            "HqfySSsKZIjCuV4AQuTKR+xLTNsIVlF8Wmq5GQCcJUw="
									"--outfile datafile --out json": "TiGCr63gCIQOUHeGUjVOvno99D6ZYJTlUm8mdNeqsBA="
									"--outfile json:datafile":       "DlMBPclRlU/OdVapaNGB6jWQKblu3NssgsC7dKisqg0="
								}
								multi_step: {
									hash:       "QU0FVHT09F5QRPTG5N4QMQAEN4JFP25B4EBNH4BVRMD3NA0OJT4G===="
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
