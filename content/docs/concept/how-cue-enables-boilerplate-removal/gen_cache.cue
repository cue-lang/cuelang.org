package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "SgSRz8lCsTlQY8g9El+tgsMHedMwYIH6EjzJQ0otb48="
							}
							upload: {
								"baseline input":   "53y/EILC6KoFOK6V9qinpg4b2vzahnSWT2fFNQoi9Ww="
								"baseline output":  "n4+7urne4+Xh8Lxo+Otw2x5hscARRT5v5P9dMOiy7uE="
								schema:             "8WBto7kLX6nC088OCMkVJ64pKWNlbaw+onG0zaIsfks="
								"schema reupload":  "ciJW+SCYzhSUng1cEV8wKyM6KUPIDCEAZv0tco4Xlos="
								"schema output":    "0upviHmB40718l+VcbfPNFpWMN7XKaMUiFMagnTlSgQ="
								defaults:           "prx5SvRwvStL5shG2Q2Hft2bIqrkkEggy1Vmz9vfRE4="
								"defaults output":  "xnJCIlP8XxxF7dfuukgxIu3AiuRueFn7gAz0zTdQHrg="
								name:               "tnQCf7m/NqqUJ69hLreISU1p7wpCJGwOSXHi+diI5lg="
								"name output":      "IOJPEFwvfHB5zjZt18i8vdSJSiB1W0OJhSYwBOsBqzg="
								"extra app":        "cziITtO1nIk2fX3AuvB8T0hhn9SfhUBTy7/fVzwxDks="
								"extra app output": "d6v9Sp0zB8MrQnvNS5EUPeT0zpktmTdQKoKD+n7vPMU="
								"pre-trim source":  "n76TRpps0GF5DktjOrKndOJ3DH676A9DA9qU6ffD+fA="
								"post-trim alpha":  "7/Rc7yheTKKKL/4dXOcAtBOK3vsm760huMPr7o9h444="
								"post-trim beta":   "JdiGX5iTDUq2orP+4omkAjaCbhuTV3JLOEVDcMFQDlo="
								"post-trim gamma":  "6F92PIYkCo7aBJniBIGrN2JPOfqcB83tPAnn+lH3nUU="
								"post-trim output": "2Uf7pq3T0AxuQWkVb31vJHa3yyBxKawulselzrX3z9U="
							}
							multi_step: {
								hash:       "O4GH87D0VSHVCL2QKPO6GRAQ5G5LOFHQQM7OHJND2RPS5FPES8FG===="
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
