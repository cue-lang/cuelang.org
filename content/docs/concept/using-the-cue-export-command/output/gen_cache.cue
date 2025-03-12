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
									"default output":             "NVtbK46SpiIdGClSaxhX8gyFVDUYag0wEGPEQu9szrA="
									"stdout yaml":                "NRFWX6d+GGM0aosNE6aOKAhEhLn+t44j5ETwJNSxFeA="
									"yaml:-":                     "zuGGDoxqeWw++Vpfk30GxSVhj4p8/zXbFDafWsGAq34="
									"--out cue":                  "PaN5c+hRwqjjT/J1Wa/hrTJkjrNqi3RuOmJoNT8Jn/Y="
									"--out cue no hidden fields": "t/mpvf1ILPt5wfVOBtiQW+OIogi2Ec9zThY3YeTK/oo="
									"--out cue --package foo":    "RHB1hqCKrB/mQ6yLmElF9I5MARGUoOgA62v72xpE2w4="
									"--escape":                   "9JMilHdgigQck5UFI/pSBrXbTe3zqTZy4uvnOmU9JkU="
								}
								upload: {
									"--outfile data.yml":            "xSfv6zvvmWZfc6KkxPjbEEE+7hweE5SHwLOSxUTRKZI="
									"--outfile data.txt":            "PqAoQsbe7J1mkLjwdcr3X8aUGmz90EttoF0kqxiXAOw="
									"--outfile datafile --out json": "SzdnI8B9XXnKqU1PHg+VR7XeNNrwA3pzGIz/T6H9xLs="
									"--outfile json:datafile":       "N77u/EfUaX3C9Mc3NlV24o+simjCoULhZUc1cG69OKg="
								}
								multi_step: {
									hash:       "QA1FVVTMQBC3Q904TKERFA079LMJGQDEBR790VRI051HP2560ANG===="
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
