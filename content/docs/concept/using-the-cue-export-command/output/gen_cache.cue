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
									"default output":             "uf7WMHT7ruN8rIazrWvgL56DM5XHsS2jw4c5h4oQN0M="
									"stdout yaml":                "w06vIDE6a6/I4L/7aywXCJDqBaIiZS3NXZPZmgIruhk="
									"yaml:-":                     "cSOjcagaxmoB0rvRxMGNbc6KhMHwkq12FOyymRyr2qM="
									"--out cue":                  "VUgoYX09IX57tv+NV/sVhykT5n0NSGB/Jn5bYt3ma5M="
									"--out cue no hidden fields": "/7njPnSg5e5FKQts2rO6vkQ5irVSF9WD6ELK0y6zOK0="
									"--out cue --package foo":    "hX+ba68sai4Pwdaq/G7Ledu9yfn/tZqnLzxW7kS6r0s="
									"--escape":                   "9zErAwCuoFhNm3o71roN7CGeAK1DIdgydKLXoNZVGoQ="
								}
								upload: {
									"--outfile data.yml":            "RB3u2v8fHJYYlpjD9mfm8ccQ8zFa/qmDkwyXHWRtCYc="
									"--outfile data.txt":            "tKM9WfnLgSn1I0V0Omenv5J30LxbEO+k+bv6VWYsNMg="
									"--outfile datafile --out json": "MeHcrpiiPzjX2P0wmp7gHuOl/L2fGSGPjMbRCVkncHc="
									"--outfile json:datafile":       "Q/wxuSv5rEjm77Qo1iTdaejWfP9+LuJzTnyRTgH37bI="
								}
								multi_step: {
									hash:       "AKIUCU0KLLJ5GG169F5TTK3FOT6247UM8DE8UCJEDJ6AHTRAMR5G===="
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
