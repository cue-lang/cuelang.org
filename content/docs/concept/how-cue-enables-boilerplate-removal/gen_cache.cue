package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "Z+vINZ44xdC4/eJsASYHgyvXQW96lJZGNScHmhmSZr4="
							}
							upload: {
								"baseline input":   "AGapuzdkL0OvnNZF1CLTMAltw+c63HGTaa8n5sUWTdk="
								"baseline output":  "MtMvDArufzpmBPEpihN6z0rwI2L7HR1nV/7R0f1vUC0="
								schema:             "hgLppunO8tjVzFMVPZ23SbkTowRD9dw/tcZN6tTr7Tg="
								"schema reupload":  "CBHVjntQX9CYMPkpC4q+vI1/3farA/mFWH5dOS8GuyE="
								"schema output":    "/2Ox7+7MHosbt6zYmJtR+PGg2eh5xr8cTQAoQlFyZFk="
								defaults:           "VbLmhE+pcYW9gZuOsk6l2lNzmm42EvgldJQ5X1GUJy0="
								"defaults output":  "66aakBGpdAj6rugnhetw6JcxKnHutc+I0Z2SthKBJW8="
								name:               "3KIgt+Ev23JQEUmuMigDf2LxR9TERuCwqmge+5DFVuQ="
								"name output":      "9XttcitkyaWUh/eeY+Aj9Lm3y7NJej5UyjNgTIRsUww="
								"extra app":        "GSZzbphbN+JnfRh7ndBQuZbP+YnNlMAWaxqoOWImP+k="
								"extra app output": "2qbH5Y0yQsVPDPR1LUHhbm1tv/Qa68TutxXz8Ni2Bko="
								"pre-trim source":  "57oz/GhhRzNWESIoq0NyAjA5bUcUoeZof1No9m1P/BA="
								"post-trim alpha":  "7AjVPfDMPIL69R4FqPjSt3M2xy+7+nnGKkkkFde2Gtk="
								"post-trim beta":   "9m2G+U5TeF6Xf14U/cn8jcvHR12TkWmjTB1PVhnOc7g="
								"post-trim gamma":  "41FMxlgI2TGky0jdsEtDzWwfMCEAgJ7F6JnuuWAyYKk="
								"post-trim output": "+TR7Hc4xj+aFZOG59zNtU5AQhmShrUbCkJkYmVulLAY="
							}
							multi_step: {
								hash:       "C09U6A93CNP0M7HGRNMEE5GQ15HMA3N7U4T00KE4TKJJO741VKG0===="
								scriptHash: "TDAMI7O77UR77HH44ADCRCULC2IUFPECO4VV33FQE8SLPFDPQ9NG===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./alpha.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
