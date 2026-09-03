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
									"default output":             "iDIg5B/cGz6kv+czCCJosZ0cx9jXNOr+ALyglx58HOk="
									"stdout yaml":                "WyZXHLCgiHph/ngfto0q+Oq/uJEd/AolRXHTLhauLMY="
									"yaml:-":                     "a1ylpEPQ70mqGygv6pvnPJY0RoG5e3Sc2d4UJHR2Kvk="
									"--out cue":                  "XjNtG9uafHsZwRtvgsnQzCQK1Es7OCmetouOY8mPQLs="
									"--out cue no hidden fields": "Ndp95R/ovqujba0lBloAtLfbMunOuEWxDp0ysQavRpY="
									"--out cue --package foo":    "RdTkmN6O3HGXRGE7UefWayjTi7fYUBUEaDz4ThtGOvw="
									"--escape":                   "TGE+B9uy61e5C5Xn6jDxhZ1PF0taRY+jKvwRJywm0os="
								}
								upload: {
									"--outfile data.yml":            "YxgDvJkvVbeXxAjgAOSM909jK2/HMpVrOhacmDxWj3g="
									"--outfile data.txt":            "lDsDTOTAL4x3wOE/HLRg0x4Wv50nmXxJw/W3dLKiFdM="
									"--outfile datafile --out json": "lIVvPU3MzQ8Os382BdXDQzhwiMdjARRF8459JS7GpGI="
									"--outfile json:datafile":       "JNOp5QekWS/H5qpzqC9zGxRMtuTIhrC2+SE+6SkscJY="
								}
								multi_step: {
									hash:       "G32UVPS1RNFBT0A54KISSA85K61G8H32A1ECA4HVAFJQEP2JE1N0===="
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
