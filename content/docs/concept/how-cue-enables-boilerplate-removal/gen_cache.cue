package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "5GWibfhqejP9D5JCavKs0UjkNSj5M2XHL9Dx8JZ4/2Y="
							}
							upload: {
								"baseline input":   "Y3bney8PxMl7C2Df6kQNYIbfwsLjfPB8xWH3W6xzblE="
								"baseline output":  "gujUSWGWT7fzdJC1bSDl8NO0z8UjXKlCKECf7sioKkQ="
								schema:             "CGZ1yto2peAzBTsUYZLB7w8VaUtGisd5hdy6PA+jmek="
								"schema reupload":  "HNdujOTgIPV7KY2AjR6S5/CDuEGrAdKJlybOmnGniU0="
								"schema output":    "Ty4GqtrayZn52jhT3nBsJMyoMU7SmQ70aJkLYzlw9DA="
								defaults:           "0WiXm5yUm9lpGfwWuf/R1JyqdhJbvd/sxan/MInRgmQ="
								"defaults output":  "IkD3lKjSHsN2k9p9sQOWGYT9MQRLA3WARVhnQgwzj2k="
								name:               "yMIvdGwSmBDqmNfMadJrZ95vWn7/jmbgVfRPJJg1cdU="
								"name output":      "Hvi7gVfLDy/bnf7IO1rifTm+lB1doShZpeYfysWkjBU="
								"extra app":        "hezwWJbPvI12j7lzksONXAYnGLG54VBdaxKViR3MwfA="
								"extra app output": "MI/I/ypQN1rwicnToQfbgm+Lay8E2pasd3bs+9lmAbU="
								"pre-trim source":  "Pies9OoxgGIw0n1gx5Dre0D2g+gT495eN4wyRycUlE0="
								"post-trim alpha":  "OHjlZ3xgcgAiNBUHJ+gTUTCOuXXmX2C8hEXgYdpO2A8="
								"post-trim beta":   "IVKOJlxQhDHOilgtv7ptNg7YZyKtCkF0rOKkMOUd4ZU="
								"post-trim gamma":  "T1sZNYYmM/IeB9Pq9vfqhEE6kj4xTtQo2wneRlzqfuM="
								"post-trim output": "P7qdela9hnQ5klpeHRTQAEikGEdnwVfjRKJP6HudVU8="
							}
							multi_step: {
								hash:       "9U8NI3P4CMPPE53CO1CNE8Q73DC5T802HSB7UUC318QTRT0TADAG===="
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
