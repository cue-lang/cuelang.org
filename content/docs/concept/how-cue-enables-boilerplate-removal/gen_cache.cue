package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "XbHjq8CKaCBpiwrmlu+nkVX7HNIF66hJ2/726U/lGqw="
							}
							upload: {
								"baseline input":   "YQo/YXNI4GVY0cbhunyxouV4YJacZFUCOXAFxToq8yI="
								"baseline output":  "zYBr4xm+VCSc/1BzR2vIrGfVspIyHPLtvKdtAZMvNh8="
								schema:             "swnDrr36QqgdPVcc1S+KgG9rwPD+jQmtPnmpCBeX0AQ="
								"schema reupload":  "lYaW8TeSRnKKBi3E8MzH6tIlIhuAUp1JDlbtbjJJJB4="
								"schema output":    "NHvRrWzizcJKW5LLuFxbnyaI/1JFbklJ7+mga93/n4Q="
								defaults:           "l1NPP8CHktXj1JTECR7mvKD48u3nrWvevhNUc1N9exg="
								"defaults output":  "s1AIlLtOFbDuOMN3VyI+tsJoG5Pjb1RbZ2127RAAdwQ="
								name:               "e+WWDmbMk0y9HaldY86VtMyPIU7lGUpBgPt9PLlqBww="
								"name output":      "verE1yNY/PmpYqcI4RmXZDKfKO0P3otuJMxf4uT2U+w="
								"extra app":        "kh2jWqb5gViUMzhL7OKXfnEDrPeGrNYyBgj97rYI/ww="
								"extra app output": "Tqu1L8XToiwVkOM0dxNo6dSwkF8ZWpdOluboOYEQfpQ="
								"pre-trim source":  "9glnpYrsxHt9TDn5kAAnHXJ2yFaDdV/ZKVhLuLNt88k="
								"post-trim alpha":  "JYBW+gHa1y3c+4U+DRMI6OOaDf2BNbt1xnRw/UHJsRc="
								"post-trim beta":   "aiDVwZIqG8YLTjElRrGU10ObFdvo/KJR/LzuU9qGPE8="
								"post-trim gamma":  "iYInP6gdbi3goHzA74V2ZSVhqg6kkReC/DADxD/2LUU="
								"post-trim output": "vH5IJUE0PiTbwGDJNO+tWcq0Jrgh5oglmOPk4G2TIGg="
							}
							multi_step: {
								hash:       "1LNP9CJN2OV2I8VUAOM0KIEL6CMPOB8TCO5TF16J9PA43LJR2P70===="
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
