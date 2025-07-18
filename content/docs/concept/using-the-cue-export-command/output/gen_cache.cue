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
									"default output":             "QZHTg+U1a2S5vVITpAzRwyPmnkJPsa7AwQ2sk1JvMok="
									"stdout yaml":                "ZtLfBh2IxxaJX5wSZuszdN6lPQ17BL3ur87HZKabUGU="
									"yaml:-":                     "L/xbCdKOQjeTZgjxEmnHcUpL2xq0V/0YtKwFRvjqQdE="
									"--out cue":                  "j55TMVvbOdOOiR9eukK5A58/5cCoIU5jsSwfs+nPC/w="
									"--out cue no hidden fields": "pdmh1pPBmYuP5xNtZ+6JPPaDIBGeC/jlyaw+KzxohBA="
									"--out cue --package foo":    "0SkA8bsjAteccrw49TW2a9Mo+ivpK1Z0hjdeztziAmg="
									"--escape":                   "B4JaDHuPVH4862rR4SyRfyLxrPMERf66m3wA7S0ntdk="
								}
								upload: {
									"--outfile data.yml":            "2g8fNX4b6gLX+ROyNS38JTaWvqoDyVadRX9JRBDZ+4Y="
									"--outfile data.txt":            "fuXYYuPSez4W+qZGdZcnG095r+3JZzGOf1nQlL28nmg="
									"--outfile datafile --out json": "cfx6qoWgpL9TzwgmVRJVzYPz3viabjy5ZY9keA16Yuo="
									"--outfile json:datafile":       "CFWloVUR0WejloeTf3KuUzs+JIcDDTVYD5d7exntJzI="
								}
								multi_step: {
									hash:       "KM11AF4I3KG89M979CP27HMLUQTLQ3QPGA0SF23TGVKA90VDLH2G===="
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
