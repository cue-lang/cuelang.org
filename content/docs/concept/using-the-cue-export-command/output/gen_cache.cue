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
									"default output":             "0sIu7zT9Hbfbj8HB14d3bVWLFEn35bY67NKbq7XNQRQ="
									"stdout yaml":                "519HF8L64gC1+VabqLLVw0f00ZLMd1WsXjhk/nfeDKM="
									"yaml:-":                     "ord6kJNZ5lxJ25fM7hbzq5GyrxPyquvYyR5ZGRA5360="
									"--out cue":                  "uQ2jEKV+HC5sflldVghsn1D3qiUO1rwaTtS7ZiVl2x8="
									"--out cue no hidden fields": "bcdAkrInyhW8nJ9HMWQvVQH+duz4CvmgKSqrEIXzX+0="
									"--out cue --package foo":    "QksGZLrPDQcQqlrTlnrDwENy2dayafYUB4L1l0hTNkE="
									"--escape":                   "IfmwZhr/IsCCFA6oqfOSDAYL5gKRLde+Lj4kVsYooHE="
								}
								upload: {
									"--outfile data.yml":            "Nr/wddDTj32ODr+CJCFF5T6pH49XkNTWgw0ttA45DUU="
									"--outfile data.txt":            "xBd5Vg/YfKOJe0r7ZEaabAZTVM7thxV7rgsTJe7BgSc="
									"--outfile datafile --out json": "0krZwcQJGHw4Qa1JEz/LGBRy6UZR8r0fBXLnAibsD80="
									"--outfile json:datafile":       "EeSSWzycQ903GLnr5x0bQr6wVzwn8wZnjaDLZGZT9vc="
								}
								multi_step: {
									hash:       "230NBPGQB0B0737F40FVUB0A2V3810G1UJ86A8AB9PVLO59RUM4G===="
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
