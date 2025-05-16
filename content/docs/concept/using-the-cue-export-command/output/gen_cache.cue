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
									"default output":             "9M8ijqLFSMO+LAjLIXX8lyR1zxCFXp3wQ/ZqiEJajoE="
									"stdout yaml":                "MfBjeChQjbaR3H3KjHuphckCfBDwjpFdZPjD7Y6pjM8="
									"yaml:-":                     "S7rTvHePUxegwKceacG90vxLYGouHkNUDF+ddD7413c="
									"--out cue":                  "H+LMVs83LUaMKlvcWrapTA/tqXqxTSleAFnESbLWA84="
									"--out cue no hidden fields": "8hqZZJtPaRJ/JYk53Cz/xc4DaaYbpb/0GS/DH2wQ+5g="
									"--out cue --package foo":    "uMw16WOKbaLoqIbaC7JJ/c/+K+lasQdzqgjhqU+G/Z0="
									"--escape":                   "wlVW/3hmPZTSA49GSo0uE/Ph8SvVtclrJ9kSj4WNdrM="
								}
								upload: {
									"--outfile data.yml":            "qEAs0FJVE/830I6U/279LPMLeKy/+EoEO8ZhR48OYT8="
									"--outfile data.txt":            "dZPcCcJ1POKs6kWS3VBOY71uij0wta8hiTSIjKRgbrk="
									"--outfile datafile --out json": "HOU5IMSQBEDYS9xzQEOGhth8ozUsMo545eujnSjOlFQ="
									"--outfile json:datafile":       "+ilEbCkobKwwzbC1SoZbBLCb70qLU3pL634cQwKLvOc="
								}
								multi_step: {
									hash:       "2VOAUC9CI47OJTK2PTPC9FDT53JJLSENC7JJSTBDJRA69OM28LFG===="
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
