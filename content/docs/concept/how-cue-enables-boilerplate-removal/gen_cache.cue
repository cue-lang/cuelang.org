package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "EUyC6BSwf7pRD7jaThwYJGG8neSzWLsTmZ99ppmrC5g="
							}
							upload: {
								"baseline input":   "uZFx8wc/WK9bneuCRCyzCkIPrRYDFGBoD3zmOMstV/k="
								"baseline output":  "gfLAm2x/64/AFwrul8zwhBp+9GFHQlnsnZngHQqT5NQ="
								schema:             "+I1CJsy2glbrS7tp90eKgxrOvK8nx1EK3qcjsyD6RHk="
								"schema reupload":  "+NR6Iv9WI18tZVF8P93e/wmLzNqj/1cXMP09SQdsZ8M="
								"schema output":    "dWkNhl58pYag6onH6/mc2HQesI7mWzHL6gmTuivX3M0="
								defaults:           "wIlYVj9gJex4E8fMSommmOIj4ftvUi1In9OvD/ayo8o="
								"defaults output":  "Zmtxae+Lai/OZod2TUAIgWz+tEdtrK7H95HdNaqO8bE="
								name:               "foGo7p1d/ZkhBEoItahgQJStE2jb5s0SGznRV+bQdaI="
								"name output":      "Walp0yDSe7lPvmPOQGqYY0o2FT42eY7Rcp5xcQ+iXCI="
								"extra app":        "/LQPcEvuVfLcDsWccXpp3tyuzCV+X6u/jV6A4jMSJLg="
								"extra app output": "sNxb3lrUvLt1e/mE5oU2od30svWdCoptX5rbueR9VNE="
								"pre-trim source":  "dvouQGZUndyIR6z4J9HaNlYPPSoLnBF5NA4tDeC6L1U="
								"post-trim alpha":  "kjC7gEF61KyXCTftKLlFG7fyvG5gC6c0tw+kt8+oIcU="
								"post-trim beta":   "dkFWOPtH21wW9bt+5QAPJOKfbVOzJ/WnPyZ9KLPKhpI="
								"post-trim gamma":  "BcFlNPLf6fJWiXlQP9U2ONPvJTgaE/sGXZBev3CwuiQ="
								"post-trim output": "RimB8UpdOACurLgHemU5NCUkq29JiTtw1Oyui8yUKdU="
							}
							multi_step: {
								hash:       "R3D11541P821FI5GKCP3O9VE2KSF6KQVA0VBRQTNOORERG6SBQMG===="
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
