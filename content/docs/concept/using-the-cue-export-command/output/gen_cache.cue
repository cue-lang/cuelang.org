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
									"default output":             "LNwJom20T3YSER2AgpO7ynsyIOITFkl3fz5pPZUQj+g="
									"stdout yaml":                "rjTzfPftrUmUWRQr7ZQ0HzIW7cxiJdjUVO83E9zbjTo="
									"yaml:-":                     "oPiKDTPSwQoypsh9brJuHwsmgnqFABbSgDXtO5becOY="
									"--out cue":                  "DyP2rysAnNXOGS/WF3soaWsakDQulSkBxwkwbhsa3II="
									"--out cue no hidden fields": "pjT4RSRqkp6/AZeLy6uXJN5Kukysy+We4TtJuOprz+Q="
									"--out cue --package foo":    "5k3YbuDgqlhvsL4qgitWiDiggKK4YXujK7MS3A9uPeA="
									"--escape":                   "VSDW7bdKvba3RgdOgzF0i5/ZMtS7srlyxIwDm/LK2hw="
								}
								upload: {
									"--outfile data.yml":            "5eorlZWNlZ+plHAF63X0G6j/5sS38C2Z1PjpGJS8WnM="
									"--outfile data.txt":            "1L+4l6wlg4e0my9MEFFEk6UMdtcZ8lQdlQADAuDPWUg="
									"--outfile datafile --out json": "i1BS8uBPXt3wKOgZJY/+aZnY4j4XQlKE9KbPaXzKFhg="
									"--outfile json:datafile":       "hc7vyYgDwkGFTHsMhI0F6K94nCbAVKzJdLFVIPjn8SI="
								}
								multi_step: {
									hash:       "OCSP4JBB4B5FTL2PFLIKDC1JNM46SJE45KN584G4KAD4P2K3HNDG===="
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
