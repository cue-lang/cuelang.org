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
									"default output":             "L4EWAkF4t0UiMzmOdtxhq3wepfnis0rSqZdujVg0CYw="
									"stdout yaml":                "LOb7WWWO8mdz9kM0fy2IN/Dc958b73WNz40k3sOneD0="
									"yaml:-":                     "XwXm985u70NLRfUz3uufmqZN+/AjSPEwq95hmtWyZa8="
									"--out cue":                  "DPlttd1D5hbXUafX7Et/hC483kTG1TMicXGKC/r6JAA="
									"--out cue no hidden fields": "PoTA5QCnvzEQEIm3bew0PV1kFVJlQIeAC9JlmEMMaks="
									"--out cue --package foo":    "O+OgVTornDwqLhtMTVcTKpaMbQP34WR/xLr8uq3N/Co="
									"--escape":                   "e8idUGU1e3/JrR1gqFfiH5s0aAftZYxEWFCrZUAPzQY="
								}
								upload: {
									"--outfile data.yml":            "oWhECbyCPdGxUFAfPIa6MDYJI1LYeoaF2aoPaVi9Fps="
									"--outfile data.txt":            "jWzer48V/M3AtL+7UqKZhncJuXAHxY6GAwX67cm+MFU="
									"--outfile datafile --out json": "k7wsXknQJ/GvbyktLg5j05MITyr8SX+2YoBVT1k2qyk="
									"--outfile json:datafile":       "PHJCDtfr18PhzYB0Z+AIAY8hMrf6HWidKJ3JphFDN58="
								}
								multi_step: {
									hash:       "917AEQ0KNFK53MRIFCS14E6UBQOEO3RC1NB5L4UIR81PQNTTTAF0===="
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
