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
									"default output":             "rrB0yIwXyCBcR6Nqq98b+BheSMau9UoFP8jcn9sm4gw="
									"stdout yaml":                "VU941YlCkHVC8QLOFfb/3kFLev8o2qPbeJb+ocEYwHY="
									"yaml:-":                     "ctZxwG4Rn/sU1tmLbq90FUsBDiLd6pHpr63mRAavgoc="
									"--out cue":                  "dJ4TTJdMrpt9DNXCzCw37Y5Tau9/9/+yaWjWVpFwCT8="
									"--out cue no hidden fields": "JCdZyEwJn99NJECqlPYGShXyrTJ5F5IU0aYmK/dJOfs="
									"--out cue --package foo":    "gZkcd4uAyfEpOxCWNh0jQAQxGnibgY6UvbG93fNXHTQ="
									"--escape":                   "yhX05a7oPC5Ywy+baOL+khHO/u3CuozJFphtqhwQNHI="
								}
								upload: {
									"--outfile data.yml":            "nBfVH4p/6qTBIIVp0EvMZxMkVQXG4V1rqKFBbdPQsbo="
									"--outfile data.txt":            "+BkBp46AQWJsOJPdvYhhUPunJuvf6ViQKW7ioaC2Vek="
									"--outfile datafile --out json": "ioe6SUCs+gdTSwvrplV+IAGeNye46+4iny0iMC6+z0Y="
									"--outfile json:datafile":       "3hQSKXAncnD6mRI68RmIW804OzaPbReCxghMG57w/JQ="
								}
								multi_step: {
									hash:       "68EVBPSS4BSPS0CN77JNDV0A18DVSD3MHFSCSM276BVUU625I2I0===="
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
