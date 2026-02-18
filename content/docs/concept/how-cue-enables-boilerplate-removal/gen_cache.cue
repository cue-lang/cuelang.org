package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "njPh0+m4T3sJD9ipyUv3R4k2eKQLqw1MSDta8Xz0vDQ="
							}
							upload: {
								"baseline input":   "0YD6QmNaRUEJZI7TQGwMXfzvKBHMBZcVCv5chBVAiQk="
								"baseline output":  "a6DAtFFI//NwL87RnYAyK68unCg3Aw7EqUlstM7+cGs="
								schema:             "7JIIUGZ5dQ0Cz12ad3vIdq+HKmukSzHrK4ITk2Z+gz8="
								"schema reupload":  "Uf0YAiwG49h0GgjZH1cmbOHRffxzVipyWJ0IT1x0BvI="
								"schema output":    "sYf3BiDgtop2Hj9h0YqkfV8D+LZlFd3CGzU7T8lecYs="
								defaults:           "fzqDRxlRhdv0F+QkpqhI8i1bh8mVABjF9zHgHCazCmk="
								"defaults output":  "H5XtMTurMuhRpAxcUTOtfVIGZehKA2l936ojdOul/bk="
								name:               "uvplwEmKct8EPgHV+OijOo/sR98pMbi+Gt5u5gzefls="
								"name output":      "r3/Vde/NEdEOalq2QTkVN2n5rZ1+jYfCrlryv1DxEss="
								"extra app":        "V8MByfG0CY8v5TQ66OhIWFhcKEwuFnkB21NmywxFajI="
								"extra app output": "Te4XtDuVlncBwST5/4pORUBoAmdNLWCXq4EPTG1Z/HQ="
								"pre-trim source":  "DZ0eVaPMPmWRf23sjP0/5lLhRH5+CE0ybdjwulH4OtE="
								"post-trim alpha":  "+iYhh/xdJZSAvwb6PwXbR7eHohrTSKg3wEhvkL78RAM="
								"post-trim beta":   "yCohZyRFefwoyMVuZq5IfPXocq2KU29WwnekvM/jDVk="
								"post-trim gamma":  "UvBrYApjQX65udt5skqEX7t59FA63AfY3Ffu1WGuSnA="
								"post-trim output": "a6JQUNxyrSk0OMGePS3d0E6ifSh5tll25/Zvv3FN/I4="
							}
							multi_step: {
								hash:       "DJT2TSEQ3BP7R69BVBQLIVQ5TSI7N6TA5EMKEQLGEDDQ0JVJ8V6G===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
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
											    ./a.cue:3:13
											    ./a.cue:6:12
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
