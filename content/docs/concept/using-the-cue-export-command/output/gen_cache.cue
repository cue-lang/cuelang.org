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
									"default output":             "9rBzdggJeG0LxXePddzPB5ADXmxArbbcVa60QWmXfwU="
									"stdout yaml":                "c2ai22EyJfQXlmGTQZ3mQiuP3wUsktLrhGsHLKJ4xaU="
									"yaml:-":                     "d9YIue3g638Rct5UXZSYGmHsAvf0VCn0RlBDJIRTE2E="
									"--out cue":                  "mwl5vy5wblfVycu+pT53bepM6eDB791lDIKMxiGr4dU="
									"--out cue no hidden fields": "b6h0o978dw+E5eVU4aqZaCaCQUBsNpNPaDscke69Ijw="
									"--out cue --package foo":    "i4gRDGyALTNXIZz+sVYgc6d5aPzyo2/VVQALflpje2o="
									"--escape":                   "P2rYkwMRGgEQ7xCxcgfodPNreb/HZz6a8B8fGsvN22I="
								}
								upload: {
									"--outfile data.yml":            "LQqdMRHOcjhQMKnrY4zM238MqdvZVhN0IazlcAOmG2E="
									"--outfile data.txt":            "bujFo7AcYL+HAWR3ltGGT73QHWIaA5Jl/M1adA3E7GQ="
									"--outfile datafile --out json": "ROkgvY4g6/Klp3sN/+D9mn4oEMaflD/5Y5xKmsCBgNI="
									"--outfile json:datafile":       "cxijzACI+Anh6uj2TnbHtTllxQYHlOCb3oYrYVKuuas="
								}
								multi_step: {
									hash:       "0KUQ7VKHV206AEMS0QBO0AFO1DRA6R7NJBJ129DLSFV3EEJ0KMP0===="
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
