package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "EUz90O8JY/ENGzxu/ELpQZUfS/MJ+pEwggnk3ueAjRU="
							}
							upload: {
								"baseline input":   "wbYu5QzP8kfSZwY6VfEQHygibuystaqMY7uZmOnO11E="
								"baseline output":  "+o0ujh9mH+JrZGUOk8TZZNbfS38JAIw2QEx+G2uURvM="
								schema:             "IJuZMy2z5ah9USPxeprKsYOPwXgWA5PuFFYOtGLmZPc="
								"schema reupload":  "zstw3kZbL0pVLqpqTrlOFMdclQaFdkw3w3PEloRsK7M="
								"schema output":    "qMOrBoIDR4jfTTv+jSvq9p+JC4ba/3kyWj3pCwyZVME="
								defaults:           "aWwqKhwnC/M+WDPFrzbfLYOoVv+S6HOEIBh09tZT/14="
								"defaults output":  "X8wvVnY52GX5GqWLv1ddQklJg8ua8UX9zX82fotcRJQ="
								name:               "APuDG/cj29vyr19eoG/2270JTPSQMfWyxZ2gn0KNqCU="
								"name output":      "7Ltcfv3lp7pNT1DExm8W2kfvM7IThXQ0LQEuzeOGcmc="
								"extra app":        "KTloP+P1M2W5Yn4WzlH6alic5DfwIA5lMWpQNAIMakI="
								"extra app output": "Mig+Yx6aMvFXJeWcU8wDcN5fDBx2aWuM5Sysg6hKSq8="
								"pre-trim source":  "mcIbR6k2JDEBpbg9SKeXo1UwEsqT4aXt1BbOyqwL+/U="
								"post-trim alpha":  "9SFiSAfY5Ru4GK3jL0Ok9aYi2HzW/X8g4zWWdYZ+RJM="
								"post-trim beta":   "ZFJoS2bh5PUqByHVbkMOaBQyVY1xDnmjpW9+VCXaLhY="
								"post-trim gamma":  "wgK3WKMZOgecWlezZor2LjaccknIrZzqBtj9SajQUDc="
								"post-trim output": "B5+W/FWz2wePd5Z4X8+Oc1WwoJa15+P3UvjXDh5ilaU="
							}
							multi_step: {
								hash:       "QRF6MG43LQ26V8B89OI069PUB0R03M80N5A6VL01EOONJ55GEAA0===="
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
