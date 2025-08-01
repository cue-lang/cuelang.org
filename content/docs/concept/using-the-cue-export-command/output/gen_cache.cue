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
									"default output":             "2lXXG4u6nyMfA06yc/Ki8uCXdGQsBvb7i43cS5CiwVs="
									"stdout yaml":                "5HlJ8NA5rUWy0xG3Edjd9Zyk+wdlpOZ7W/UjMYTpAHE="
									"yaml:-":                     "aLUTWoLeOZALPiQ5/gwGE8O9xmJv+777yQcGLQZguNw="
									"--out cue":                  "JsWhlMzy+MeHHq5JDn5hnleNwgGborDmsCJa2V9i4Ls="
									"--out cue no hidden fields": "8lKoC2XQjZl3R3qOJi5skZRMnjN9RNu/PAL6c6xIlX8="
									"--out cue --package foo":    "uRA/UvmyHUg0gxuH9uASa97lAFggbR5mkk9ca+Ox8MA="
									"--escape":                   "A4yOFAxgOqImw3exHQ8Byc3oSiozFKMboXu4R98gxk8="
								}
								upload: {
									"--outfile data.yml":            "i/ACNSGh1HYQDhzq/U9WbkpPtOXwitphl5JLad+gn18="
									"--outfile data.txt":            "ZA9n0jurhsKWvl6y+Vu/4VT2QT6a5USjcSt33g0gtXU="
									"--outfile datafile --out json": "vv24HJGFR5WBk6yGeeyZ0+HcJ3sSvemDenDMERJCTgg="
									"--outfile json:datafile":       "RC+MmOiEUiQZ2MbNgurot00kxV/ltqK7i2dxVylZG48="
								}
								multi_step: {
									hash:       "MDDBH7SD6PFQ8FS2HC4ECLQ089J0C4AF70J38OLC1VH4EPHS5HPG===="
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
