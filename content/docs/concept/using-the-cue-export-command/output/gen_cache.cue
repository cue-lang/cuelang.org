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
									"default output":             "X3vCHTezitlEfUr8CWm8x+YsjA+0jvbIn3H3kliDEto="
									"stdout yaml":                "TWtzNaYUWzRGQ8Pn0MzApNbgWYwZq3ym5+PEWTRgGbc="
									"yaml:-":                     "8jF7c+tvSwn4gmXWBHExrmOFpcuxE/fVG5xyRj1GTm4="
									"--out cue":                  "mdtJXsIpGfe99kmNicqr7YM+Dx43llE0w4TQuB+PYPw="
									"--out cue no hidden fields": "SRJsyqFVF/lnFlbY3URd7BoiUe3fwb5pwslq/0IGD0Y="
									"--out cue --package foo":    "fBQ3E5dKU9JU2+rQjLokEHpiEQawkU4G+rL5F7l6SxE="
									"--escape":                   "V8T0fuIIkOE5xsohcprMZdz8ATlAe/ZnyhszlwqLV/c="
								}
								upload: {
									"--outfile data.yml":            "g2tGoNWMSyY2eIiQ2XTv1mGPH9eT0+iOrwXgkIy32ps="
									"--outfile data.txt":            "bvXuQ12fRMhX9+hewu9yUFMM7Y0AzsJtTvr3PdMWyn4="
									"--outfile datafile --out json": "QrSfCWpyWI9bTudPzDbsNMX72K3FFzJRdJqCmNbClcc="
									"--outfile json:datafile":       "wxnSI9u1+PNMhZiiWa+UbTwbw9AdFD4hkjCa1diwc1k="
								}
								multi_step: {
									hash:       "PLE9VFLTRA2JIJVVBUEDJF3QVNR8BGEUJJB8QOODSNH22FT9R7V0===="
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
