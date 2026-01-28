package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "1qY+zLI84ouww42iPxaoZcDvyrxhApgHacryWf9pjdE="
							}
							upload: {
								"baseline input":   "TDWOyzLkFu+5maXPHWEKcvGbx1Oqm2GI0xM9yiaQFig="
								"baseline output":  "Nl57z9x3FHDvk/O/mlfmGeKen6L73BuETW8rx/FzmRc="
								schema:             "DbDbu+ZY12kkIU5CpS/fbgLGkSWr0EFb6DDnzXU8OXk="
								"schema reupload":  "rhq/vezv8jT94jP/UvaZT6bqgNdjt95OLOPWUti/YHI="
								"schema output":    "MiYtFTT4FJJpaxJt/m22xJ30aNwNcCQ6OasHb+tsxtc="
								defaults:           "i+Pr3F37O0tV2+9b5oGhqXTInjXZPxAtwUnoVpNAgok="
								"defaults output":  "eeKhj1MQNmMfHxwe9lpR3tE7nXRnJvLT974kR1t4qkM="
								name:               "EM3TaOZvJFqe993adOwXjHifBgFvzxjgDXFC6vme6U0="
								"name output":      "4Td4gY0IAOmkOU3/z0ebLhsjlk7pN+eQPUPH9Q8969o="
								"extra app":        "XWzu4ozBboa0PCe6vCZM9YY3c2hEX0bycDtsx4OeZ00="
								"extra app output": "f9JaknuXfMTUntEGgL6QctR1ev+DcYNBcSdtArgdILE="
								"pre-trim source":  "QgPaOAGVHZO14GKN6lVj5jIEjiaNffmQiAT55A4bCLc="
								"post-trim alpha":  "K3Oby/TTkYUeJtM3PeNAfuK9uvVWWBx8xQqExVZU67c="
								"post-trim beta":   "T+vVjjLU/XPedxh3kHE4XDBqUawI+a6BDKlu9yYZ4z4="
								"post-trim gamma":  "EDbJqzsvG6Z6VDvNwDGqIGKnJWj/27ukSJgFPpDlPWM="
								"post-trim output": "lIkWLzHRrKlqK4EHrSJa/uWeLGTW0UOk/DNUKMifFPc="
							}
							multi_step: {
								hash:       "JTHCBPA2E0O5EQ6UB9MRBDJSHP57UTSG7O9AL8VSB1G2KBHS33N0===="
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
