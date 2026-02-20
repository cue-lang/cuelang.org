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
									"default output":             "THE2PvbC+xVPEd+BifzrEoEO3Odm41kjLk6Ct+oLKsQ="
									"stdout yaml":                "VzmgUz+ocRg5MB09RR9brCR+L0y19rU1/j0f9mwacBQ="
									"yaml:-":                     "bNKW/Vnyv5vyt0MCECw43u4vFnq5PQATS2ALnxK7y0I="
									"--out cue":                  "ULyiSfVr0JSzVqiEP8xArQPKYF3IzsC9wfhyXj3hmJc="
									"--out cue no hidden fields": "XM+Txf3U9mpcJy1vrhiuY734rdjARWioGc/z1A9kXjk="
									"--out cue --package foo":    "sIaXdIeVV5BB466FkFD+xESK/+sfO61dndLbML7EeKE="
									"--escape":                   "7VOEFmiaIPLVXB46Z1tGEmjrYVnc7gduwYl8JtbhRt8="
								}
								upload: {
									"--outfile data.yml":            "9zrZcMhWxN/l5uf0HfgE2Nz4z3u7wV5fzN59qjaDbFk="
									"--outfile data.txt":            "f2Xu6QbLm4mv1uEo94D0Viexu3NdYXBaKaN9wT+fmN0="
									"--outfile datafile --out json": "ad0s1lMfxs29SFBFogjk8TffeQu+7UrYuYNLJNv5m8I="
									"--outfile json:datafile":       "HVfi/hXP9EtuImHuSSeAw8QkH9IK4WlHk50BuKd/xxk="
								}
								multi_step: {
									hash:       "AVJ3ULKBJ1U1IQD6QFB59OAIO4ED7RU90BECT2OSBUTKDQ18GATG===="
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
