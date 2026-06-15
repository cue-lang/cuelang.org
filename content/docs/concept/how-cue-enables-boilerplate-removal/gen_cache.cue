package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "SkeJJ7OBf8PQiqmczWvWpOSMOCyImIyi19X6IGgtp94="
							}
							upload: {
								"baseline input":   "hiwYdzE7nANhO3DgRJ4vRPhZY5+V8sAFS/+6o/DUn9Y="
								"baseline output":  "l/P0XvUIjr+RVmZZEjCfB7hJBCf+VOBhgfMR8KoYSYM="
								schema:             "Vr/U4ZEaBcvgCj0CKhhgmKgndQspWw6omzv/e6BPDkA="
								"schema reupload":  "FpbbBlExKVO03IZ2ejXSVRY/Q7dPUFp2dj9kFPdhA6E="
								"schema output":    "UK/lWMakS8LfsulLGl3p6TIWJgtew9hQOsLUfX9Umf4="
								defaults:           "8s0hnkqA9ZzbYS/wO59uYMNOz30G3sWTIMOTchP2SgQ="
								"defaults output":  "LFRdPhDZuhWgAC6zYxqJaMRILBbLUQTwrbo0WAqmOKc="
								name:               "AjRV99TcE5xY1afypdEKWMdc4dqOeg9WkBlBU3lMw9Q="
								"name output":      "7YiFi1d667MFu3E4pkygBwCA6cTguFb8XIti+QMZZiA="
								"extra app":        "bObNO6owgZXe+HUSYocwZ07SdiQX7obr9HrI5zRkPpA="
								"extra app output": "IQvYQDBcnaQUMg9nVk1NrVZAyg085wk/togceu5DyxA="
								"pre-trim source":  "0vE1bQpnKbofQroZMo0+yGht15SHkKkZFxVX88Bk4uY="
								"post-trim alpha":  "1v4eIvyZBwlga0yvwcmXkCwupcEgRyHIOVGKxBPprzM="
								"post-trim beta":   "tb+1hmtxp2RB04fvqgs8C3PnFObaXx0Imik3dP+dctY="
								"post-trim gamma":  "TxmvNE2Nm1rmmCgELPsqiu5W+StVgxffZHSyPErEU9A="
								"post-trim output": "5faCtc9CiLwZyVmpVNTLbVXAuiDIuYUnMqzAXcWAz0Q="
							}
							multi_step: {
								hash:       "V5JHTGIIN2SU3SIG1VOQLE65LLO7EO628KG07TL6308EE5N1EUI0===="
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
