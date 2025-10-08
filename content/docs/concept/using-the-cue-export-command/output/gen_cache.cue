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
									"default output":             "2VHwj9GU7URyC0LSeJfDuuCv1OOEdCta2fdM2M7Qvtg="
									"stdout yaml":                "DEXbwg7/YJevOt47PFKEzCfPr76FxytVHrVMA6r0x10="
									"yaml:-":                     "k3ixJkWdM6cDZNwEkqdCSgclxmsBWoljRCo51TnkrME="
									"--out cue":                  "G8Pz9LnE5B2OJ8thLZzB5WBur2ICl9EjFwuZCuejuiU="
									"--out cue no hidden fields": "xnbywV09cI2eDgTIVA/9EQdY5Y/Mv7X1Be1YF2WJkTE="
									"--out cue --package foo":    "oHo3S5naxv+wPfSRdmyn9VcTQ/QdI05/oI2+03/kOBg="
									"--escape":                   "rTwE3JqafT9VbckLszt/PIqaL7j8rKq5HJb/y2HBXZI="
								}
								upload: {
									"--outfile data.yml":            "wHFo+js1ZewsGRC8VNGeKt9qHm8yuDvRqbE6nQWquGI="
									"--outfile data.txt":            "M/o8S9CITrdWvWfpOlS3zcNALBnsb1Ta/EI5snUUV8c="
									"--outfile datafile --out json": "QgZENCZvw5dXipbI+L3OPeCMa0dUm5Uq5MXeTHPgbOg="
									"--outfile json:datafile":       "7UqfWKhdyXxgoCs2unGza3e81d8UGvZaMpVxshU3RGk="
								}
								multi_step: {
									hash:       "27CQ764LV5439T8207TEMK9O95PBG95PQJ05FBTVRCVAKVUIKE10===="
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
