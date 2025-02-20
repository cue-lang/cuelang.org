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
									"default output":             "tVdMKCcTEBlLQ4DZQdy7IkJIHgmQBtu7DxgeVGziHAk="
									"stdout yaml":                "5UTzqziAHJyNGFTBphkfbS8uZF46diZKfp7+9pIbzoQ="
									"yaml:-":                     "p0ay05UJsFfFNS5fsqstSqAGepcmzl2CeT2LIq46sTc="
									"--out cue":                  "imCftrVRVtv54r/vR/cG+cH92TXM7Hx3KH7Y6G7j9GM="
									"--out cue no hidden fields": "oXQNMyetfBQ4C2J+UFwDLnJH5MFjU9o11ryYC5eN0ak="
									"--out cue --package foo":    "o8E5f45CUOflswGMzwihF+hlUt3m3dQ0jHtyBuZfZyU="
									"--escape":                   "Hm9fLnH77oFJruL5hs+/ddAceg9/iO3lE7rf6A6mMCw="
								}
								upload: {
									"--outfile data.yml":            "xIj+bo7NiwsV7bGYM2FPhqVmZmAKjbGNZuy1fSIbY+0="
									"--outfile data.txt":            "SMcxFIR22K2/kmunaopfk2JPSFLe1B5ITxlDDrxuA7g="
									"--outfile datafile --out json": "K2ig6QEtDPq/9UQjESGSLyKVZrhRzSvENaAUw2QHnRw="
									"--outfile json:datafile":       "w+D+5+/ajr60MWkSr6tsrlu6XTBCcQS39a40X0/DABk="
								}
								multi_step: {
									hash:       "AMI4GGQED3EFV8INS3OU7P9BH7UFDT6H9AMECP2N4BCBSNDL60MG===="
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
