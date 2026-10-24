package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "GEZ/rMF7VCFQRtm1PrT16q1+pV09jh6g5pDbqTPpEc4="
							}
							upload: {
								"baseline input":   "j+iQbyIi0BlUU6aIF5OvmxWD4nO77FVBdMqCI3fr+Z8="
								"baseline output":  "H54xsJmgIvHfg4ZBdTJdSJ6a6IOfnJ1ohtf04pE+5hg="
								schema:             "i81xyxp+pOy1kj1vDqx3sAfjpt62fzNiQU/DUg7xz54="
								"schema reupload":  "+5v1pXnbyiLcHST07SXbeaRp2D3jAiHDnhEBPTj9gHk="
								"schema output":    "gbet5ArGti+nMqkhd+5lPMQuUrbtTjv5ZKOAXMHdzvo="
								defaults:           "44YAc4XFOr+alAieShGTM/pkLHRQ04urNHSMmRaY+4Q="
								"defaults output":  "u5RP2lOyDAwSephWuTFOkaU0mjpm6FMHo2ZoUGeXqzY="
								name:               "bp4zbyMYN1GV8/Qgw6W1cA/vpObq0g0UPj6zcH4DHFY="
								"name output":      "PzkTo3hQZWturq4Co6YRHDIQ22uHM/Ukr/FK8JOpzo0="
								"extra app":        "TZ5h/ox9zwuYHyQZ9KwmROq47/+/dXLQqM3Ypqs+cT0="
								"extra app output": "rKzNcKu0aoa5mj3G4uWd+n0I44LdKuY4+XES36tQXTE="
								"pre-trim source":  "2EvDTFuBwfKO+vhYdWm2ncHRTXexfeL7m+h2fL5ONS0="
								"post-trim alpha":  "Ot8xgohGq7VqTsYCkQYGqEHMqfGQ9EQ4XX2vBfdPC8I="
								"post-trim beta":   "LAa3EqJO1eIXWqjDWIqwXeONndnZvzXthBr5VkkG0+I="
								"post-trim gamma":  "EyLiOV9oYpXqbOVLip93fXBgxsq/pPlzek1D/diLjJk="
								"post-trim output": "ORWFNg1MRTceZ5KfPUo5lfjChNK3jmiYKiQzcDePuQg="
							}
							multi_step: {
								hash:       "OSNAKVMB40O6O9GT7PLDHT18Q25JM3KVR9D0KK2SCQUUJPAFMHM0===="
								scriptHash: "JIPADP79TIMUIMVVO8STGAUSB5BK8PD9HO8VR1AGQAL09MO36AU0===="
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
