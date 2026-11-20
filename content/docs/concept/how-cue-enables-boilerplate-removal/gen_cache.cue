package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "2Nc26KUh4Abo7LT41g6HU22LaVz2Cdi/Qr3TtILDvko="
							}
							upload: {
								"baseline input":   "FEim7Dj/ZCC6Zpe5WuBme36qtdHYagtAtWqJsqO0t/g="
								"baseline output":  "X4KNJmNZLjQw4LHCju3u6JOrdwkVvR2rC5l1SDmIT2c="
								schema:             "D8HF3+opDipqoAlLNXdU8PTDK/IcMPLPR6FflUbzBO0="
								"schema reupload":  "96pelD5vGXPmA4iH/6roZuUlCyBpgrlCPtLRT0aSHgU="
								"schema output":    "lwpo/4MVamZoxMSm9vSiNeksRVl3Ea6xcGCy8pE81YM="
								defaults:           "mdvPIWPu+F6jcyZ4sR5ItTCBTjTkWJ9jYP6me5msEbg="
								"defaults output":  "wgfcm+4YrMzrJDgK6jZzu43ioWXlC3n7jyyzCF/MQOM="
								name:               "jcs+CgQecPIycybEsHf6xwQlkDIfquRau+REStZxLYI="
								"name output":      "jAI/A9+LdjzXm4KOJR7mMkqTjRkmSUCdwB3FQY7J+Uk="
								"extra app":        "1NQgG/zFCgHzcIORV7KOrlnsOMilEkgPlHM7r49f3Xc="
								"extra app output": "rgLtlRQMbwj2LZhYYgYRDh6YfX59E1t6svcLP10rMAc="
								"pre-trim source":  "9MSZkVlF9fH8Zz6Hxipl5qnoDtPW8xuIdi9CsMgmGtc="
								"post-trim alpha":  "g9+t3HZH1SFMEGKzIsxGN9ql6pUHYSVk86SPlGqL4Ak="
								"post-trim beta":   "O71v608RI3qWQMRZF0onY/AfKQa6umDY0g37vgLYDY4="
								"post-trim gamma":  "NSGxZJUVrQ8fEpGKmSoGKG+OdSrkXaDHTAX5fRlux9g="
								"post-trim output": "Do6jCZNNIkmjMEZld6GDKe214dVTwAD0pzl0pW8AiXg="
							}
							multi_step: {
								hash:       "OIMRFLLI2891FLA0GB6P5BH1ONSPAILO31S7I5RB1T69RKIB7P50===="
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
