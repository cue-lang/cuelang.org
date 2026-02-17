package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "b84c9dNu3gaSExmsFA+H0QMKHp3NjdQoc123m67GJoM="
							}
							upload: {
								"baseline input":   "ZxbwLYzVKTlAxLuFvY8SjW8mYlpqznEo1y+gAOni7Ns="
								"baseline output":  "0WrV6+sEUGh4d++eHX57SIvCvnNzlhIKNnS18Thm9Vs="
								schema:             "lYM68Lg7qVZl0JQczhsUH+aV7OlaCVT8JcWpFJKPfJY="
								"schema reupload":  "yQYfev7nzOZ/BXpmAzBDUpiGUqXoVRJb7WBSHfA0TFE="
								"schema output":    "yNCAs5QAJr8mSeu6Qr9O3r+li8VyOv8DAMSiDM9QmRA="
								defaults:           "hyrAgsAytPwLFnBLbQya23Waw1JTOD/SQQxdeVRmSWA="
								"defaults output":  "lI9Rw3XrPjWUovSjBxbb0Y9m8O7hQeXcOcPJJcZSY88="
								name:               "DzKbD5id4LOnlMuYiQC5VWhbCB5sayzTWjtlzkeBwGM="
								"name output":      "uDb2ufsduE236D7OB9EpXAK/pYtIGY0vTTuJcUYCqoE="
								"extra app":        "KgfVYJLV6mrjtvDg/3cuX4CNPWhGEgnhrUxL/FtsU3c="
								"extra app output": "pvfMtm/D3CjIvgOp2XffLJMmB4QWel24X9gC+n8Ld1s="
								"pre-trim source":  "USSIRISWe3sWgFUSwSZw2TwYRqJe1/X8sBXVZA9mOw4="
								"post-trim alpha":  "knWa4ELDjg6VmWMngEi0jp/RJ/ObIkHCz3bHL2j2IIA="
								"post-trim beta":   "e8lyAU5WgxhoED4a3ODEjhWEVAVJxRDfUn6Yi4uM40Y="
								"post-trim gamma":  "7DtPiw+AOetBI6nNyNRk1ExzTsAeiyVBgQGehBG84Gw="
								"post-trim output": "ZZ9rv/Us8j8NjgzgVuXRfXExpmNZ87MFGxygqmZqCx8="
							}
							multi_step: {
								hash:       "R63QS7OU1PGP6M1UV4H03IIQ6EQ20G8K7GU0KO8LFBDAEKNORVHG===="
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
