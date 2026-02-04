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
									"default output":             "yVLjGKXJ4FfuFgq3vrLC6JeIklK54C9ZfVRQPXeIB68="
									"stdout yaml":                "mO0UwEa4PsIanHSiwDEr7VpPzEt8fD4nnBfKdXH9eCk="
									"yaml:-":                     "IpCgVoL8G9T/mAslo0JpyRg1tI2R4dTbbQJT39De5FI="
									"--out cue":                  "NOGLx/SF7ptCPUw/Nr6l3sLr8cBre4YE2E8aBqfN524="
									"--out cue no hidden fields": "BRm6SG7rUDKvB7EfHjPJX3jWfv0DjNRYJoNVlmq3xN4="
									"--out cue --package foo":    "3524cZMXXsqPnMzddHKmhtvphFY7woHHrmG19WF9JUI="
									"--escape":                   "hLctnB6dSfGlgowEbKZ46s81tFVU2Yq6+1qzsp/Pv2A="
								}
								upload: {
									"--outfile data.yml":            "huSv82zhqd4/LovimsQqX5c5euAzEcdLzsy/7UKHREA="
									"--outfile data.txt":            "ZB1VAkbrk9qfJRwA86J5BmeHn0l6GnP0PyWeZmhDxes="
									"--outfile datafile --out json": "HHQmoWrtHJSqe2RVzfOtZcXLG4hyH3F6lUEwcS9jaq0="
									"--outfile json:datafile":       "HGzKed/9V+5Gl5t9He5QbYn87sSXpzO+Rx01XV+2W68="
								}
								multi_step: {
									hash:       "QK22OC8HIRUHN08MTPABJMQ34KF6URQL86D7673H250PCI8EIOGG===="
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
