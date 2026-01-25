package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "c6v/xQrpkzkYZCp0Z1LveclYYYZ75q/z6o/gS3Q3RtU="
							}
							upload: {
								"baseline input":   "x7/jHSri8rTKjT1zJahxQ5spI1SGrmeJyBbUHQkxj/g="
								"baseline output":  "tdkVN3835/BGQiuHmywAbpQ/u/D2Rr5pb/pmfAoWndg="
								schema:             "qf0zAjLLsW2cH7R9hmRBkXtAUfx3K1WDvI3r27onrQ0="
								"schema reupload":  "+w2iBf8RzNXue8aIwypEOQyfifXxMIxnXW+Ed7+C44Q="
								"schema output":    "+VHrXqE9A9oNVrOB0jP/S5m1+ZGsKfGVxR5eEluLuzE="
								defaults:           "4xzy01QC3tTZVd6DUJEuSqwRjDMVAR4LrFrVkAxTNGc="
								"defaults output":  "enQ84iZEYm+HGVHlZEJW2kw8wrko4tdyoDuPRkf7z4Y="
								name:               "erfqLniJr9OhaX4Rniwx+M5dMfKeHYwiS2UFyiQMHXY="
								"name output":      "j3IOWAwxrxwTDG6Eq94TjlSC2GRkq4NjJik9Eb0GBVU="
								"extra app":        "kh22AYwXBds3EOq+cNRFI5/tWMsN0srIPGi/UPyHpxI="
								"extra app output": "oJVCMr3qSRjWjJC9KX0QI7V3DrLpT6WdGfd8YIGwEd8="
								"pre-trim source":  "1yskVA4U+Qe4zMEr49h/lKQ3GU0sYI/ElfojIBR+6Rg="
								"post-trim alpha":  "3BTs+DTxTXlPYi6ZnqD7SIdiZ5AFsjDCJFZYHXMmw1w="
								"post-trim beta":   "8cyqkfjfn6ZLe2+hzx8ikTbN+UmQKggYLJ89pgTR8wY="
								"post-trim gamma":  "6R7J7uiIXkAcUlDazQyvhmly4+bJq6GUaq30UQb2iEg="
								"post-trim output": "q7B97Lhczy2KF11djs7gcU762LdMCdJbZBgCqzfzaYI="
							}
							multi_step: {
								hash:       "QIGLEACSOLC7OF8GFFOQU698U26U0S1U74OPOQABI81CIVPQ7Q30===="
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
