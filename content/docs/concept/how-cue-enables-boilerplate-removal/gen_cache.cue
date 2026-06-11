package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "bEEn4c9UN4MW/IhEHfGbCqunihvZRFUy5D+CODe2htQ="
							}
							upload: {
								"baseline input":   "0jgUEURUajQmkbMzNR8u3G261+ytX79flNWtMQ68oBM="
								"baseline output":  "346U+nixHY1X+U9GInYnzoxpWVv7WqSo8Rk245OOG9A="
								schema:             "+lID5YOZ635WyGouPDpwvso1Uqq5e1Q1nfOpowQ4bj8="
								"schema reupload":  "0dEzqyNyxJPF+xa9oNmA1zPQjJcWiIEXBTtNFVdHnzQ="
								"schema output":    "hZ2h9swBfwi54jCGvV8Cvs8oCQwXraC9L18VprFxUQ8="
								defaults:           "gr79oNL84PQqYKdM6kEbTT6+B54JF6QExORkh9B4gCc="
								"defaults output":  "Kl6WCNFesMJ2QQUVfvJENM9ol05ddfqv3NoOVkMGipY="
								name:               "hqTnLXOKPGmk4Bp6LRKLnkafl19dZSj1UubqPZfTneQ="
								"name output":      "LJGnuyaBLuy+vLavip9O40ATvlO1UMaFa9k+Jz25idk="
								"extra app":        "uBEXI9jQGpQztBqcmXydzMX3Y7k/I36758EJwRhsLr8="
								"extra app output": "Qmgsg0es2A3MNuMi8mjF9anBCmG3x3Z5jocEn3/s7mE="
								"pre-trim source":  "+3xRwC4kV47dms+6otDM/F3gUr3LZvu4agoiXIN7UY0="
								"post-trim alpha":  "cPsQZx7FJx0XKxKafR67bALrQfa06hpqYLhtMcy1r20="
								"post-trim beta":   "ASEPwXZAJjZfzRf4ghLS0cz87djcq4vD90hlMohK6WA="
								"post-trim gamma":  "67fyzP5yZK88t13+39KIhjmSSmm83kqDDkmZUERqcB8="
								"post-trim output": "LHqiAGqwmEoGnHEg7w3bxoR4cBtP1Gy1WjxyHN9dq7A="
							}
							multi_step: {
								hash:       "2G8DSB3FMDS99U7K35F5LE2MHNMQMP6SG61LSN61L54L5M5SMQKG===="
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
