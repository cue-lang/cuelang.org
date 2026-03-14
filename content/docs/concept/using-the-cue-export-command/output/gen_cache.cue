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
									"default output":             "zv5x/BA2AtG5bbn4DgIae1Y9IUsXuathdpWv8rywVPU="
									"stdout yaml":                "kawqONrTVd4JBqIblLihMBg1dR7VxCWHI9wr0c/hBhE="
									"yaml:-":                     "nPs4PgTjgG2Euh5ZXSff/oAkTvCVVAJwG/xKQ3Ti8hM="
									"--out cue":                  "f11/Ei2yqs8a2xCgbaq5SgWwtTeOWHPnGLuue+VLHoU="
									"--out cue no hidden fields": "TIcPbXJ0JujClY6U1qzQff35qQW0mDgKWhora3EnpfM="
									"--out cue --package foo":    "In7OSl4VD/mUR0No9imM+BL5z0gKYMYw9OGV0BZ8U7E="
									"--escape":                   "vTamv0Gx51FnkjFmLcK4xXb7tPpgI79F+0NyNfTQkK4="
								}
								upload: {
									"--outfile data.yml":            "oHgK4qoDx9gf6V4LKaDRNFzLSthmrSBH4DTQaxAhI5Y="
									"--outfile data.txt":            "eAaSah3nyWa17lb6l3YMvzOHbIBue4+wIyl3Aq5u6OE="
									"--outfile datafile --out json": "jGgd+a4+nzNHiZ0qz6gfHliv8yvL8jlCclRCO/WqnYk="
									"--outfile json:datafile":       "58o7cnp7LbYaqLSOm1NhmLSpN4EqqzYugF5guYcVywM="
								}
								multi_step: {
									hash:       "QG3Q9SRTOB4PSRBKN8N81VRQRIFEFJ092T4V83LMM3T7F6E0K77G===="
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
