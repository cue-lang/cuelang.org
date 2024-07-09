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
									"default output":             "ZrScq75chbYNf5V3hZJPN/LklUtCwGioL4416AuY4DE="
									"stdout yaml":                "byOh1ct8TUi0t8o8mngobQNu0kws/MmKhJ4FGca4a3I="
									"yaml:-":                     "6anC9tjERw2xkIBsF9zFdNpc7IcSRYA9u5EoZYDDAOE="
									"--out cue":                  "dX6kfiG+M4XKJf8ESz2H2G2HfGWH22gMOyH++Crmjqo="
									"--out cue no hidden fields": "ifzwZl0kdtu/qCCkGompnVIiKMZf34u/sty4dfV5gx4="
									"--out cue --package foo":    "cfJPRr6grVt9VynDG9DR347fWqr5ngPnfM1Wvog4GfA="
									"--escape":                   "u4impBTBYDRYFUE4xDLtIcRgrl7F5fT/9ijgtLb+Yyc="
								}
								upload: {
									"--outfile data.yml":            "8PqXUFTWdobbGwRqTnqm49mECVSamQafB/eA1eSzBGk="
									"--outfile data.txt":            "7nQ9GWPc+RHeKrXOaI/e8Dk6UEKWJSeP2BoJhMo1mYA="
									"--outfile datafile --out json": "ScNX4DN4plKi3QjpgYYUdzdJg87PZRnNIvQ1zn8oeZk="
									"--outfile json:datafile":       "FARCko5YEjRVHI8jd759VrtdUeN9znwSQpSEYrto5cs="
								}
								multi_step: {
									hash:       "MM8LAU9CQLV85VLECV6UK3VKBG2TVC2DRM56SFFF8FL9FK7CRKP0===="
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
