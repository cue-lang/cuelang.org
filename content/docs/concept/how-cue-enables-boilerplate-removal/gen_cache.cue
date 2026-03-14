package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "uGna2RBNPmmvtsiYBZ303RHuvtvjdB32L6boMaadgEQ="
							}
							upload: {
								"baseline input":   "hCbtcaOTGtsAYRmqR6J/zNeDyB+W0NqXbypD9g1nJFY="
								"baseline output":  "bwsFNN0EivXjLHsz1Me3K/ThJMKKHow0bikHKZwIcXQ="
								schema:             "LNhsvuBXUVEVwT/4JDXA/y1fKxSklhn+spHA+W9/uiY="
								"schema reupload":  "49fNYRNgE6IDxP2J6FzudvBKamiigiggDAOgeFiTfpE="
								"schema output":    "73Le4OLBuEzJr5VOPj6DfI19+8Ywdop+zuJqxmloixc="
								defaults:           "ywXm1tXmA/bv9/b7VG4Mjuo6nxzTSRG8ja9vyNaz1EM="
								"defaults output":  "LGo/RbSG96QwmpwXOgfhNj3Ez2jDYwk5ND2tpxPdm20="
								name:               "/9nQYdSCVQAvboOn/0lPdrslUHLuBNOfzwfgXH73ykk="
								"name output":      "SI+I2ZtRkh7LwfRTtbxfoCI9zw9Mz1Ji2lq5F60cyrg="
								"extra app":        "V1EboHwFhNpQmfI+KNcIl1BqjKKrbSzsOYkix5PSqgE="
								"extra app output": "eATvIyNW5Kp5suq7hyLjVVJe2ZI0WYo/1ZVXuO8lKko="
								"pre-trim source":  "et4ItrY3iQITJxEilH9w9Kz9/jMkYt4aCI32493cJMI="
								"post-trim alpha":  "UdD573neplNDFCFPplJK8nFcbw546oja8ELXtTBskes="
								"post-trim beta":   "/avaH3sGaC20mTyNySmLDCbuMYfapg11pGObAlMIjaM="
								"post-trim gamma":  "fGb6ev/P5bOXybP52d/N8Vliha7myd9zL7xbjtX2GeE="
								"post-trim output": "sxV6GsQ7jz8o1PRjcc33/UU5ZZy85p5OblJALCG0cRw="
							}
							multi_step: {
								hash:       "EBAPKIN92OQGPM26P21D9HE0VVI6SDHDML8K3NSNFBUUJQAU9KL0===="
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
