package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "JDD7Fv0/mszAhozNr8V0fARSVYSgnN3+e2+GPaaNsvw="
							}
							upload: {
								"baseline input":   "0NelxzVpL7JlF8/LziSMeIIMLlnWqOmg0HKx5quOLm8="
								"baseline output":  "DTvJlIOD7SJva4bOrj8I1A1eCHgkxpCHADpOtwrGcDc="
								schema:             "mYhOkrDaTdc7QHZ3N0cycBIuOn/sPhN/MXO7Z1c9i6M="
								"schema reupload":  "5bTEeEwzzPcBxRTWhFLuZn01+LCuc9/y1a6v6nK996w="
								"schema output":    "mpU4WeNAIOcf/ixNecjNz9jq2XbfpZyhNmL9SDbk580="
								defaults:           "fUwXE12tberoOG8hsVJjesFvdr6AyUjowN3JWtm8aqg="
								"defaults output":  "YnUJqXruCfTeNngUioH1hL0LqaKnIN9CH3fBiAuxihw="
								name:               "4f1LpIkubLmnXu1PvTUO0L27G1oz4Ym5IM2Kb33hbHk="
								"name output":      "p2Sunj4Yz5KisZg29A3aFsBGkpqcF8up5Yb5b0hwEPQ="
								"extra app":        "lPaQfg/MoyTpdvoe2uMVN1s/1jLz9XdcVnqTTDxjE5c="
								"extra app output": "udPhLim6994W/aCprlPqTRbX1F/b+jgfusUETr+BauA="
								"pre-trim source":  "1O/KPVGrbSH8yHy2yb9FfoYUJal4oSEhlNmjSkR7NKk="
								"post-trim alpha":  "2tFXSOewVOyuaag90TnI24PVv6CUOaDhGFWCfGYiu/4="
								"post-trim beta":   "tCf/F4sUhqBBxrSz5LvdzhuTyBhaXOvqfy4739ZjSx0="
								"post-trim gamma":  "7PMvp1b+j1Sp6fLkUpinuVg1+u5EJRQ6k9dOnfy6BNA="
								"post-trim output": "VeG0FsdD/2cVgoE+oN78Zo3ioWj8MEw4tKBk0aiBT7Q="
							}
							multi_step: {
								hash:       "N4UVO088VQSA8GCFMOV3DCTS1RGJLIIEKA3H78F42TAUQAVFTCDG===="
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
