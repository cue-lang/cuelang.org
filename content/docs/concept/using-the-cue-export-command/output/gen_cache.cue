package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "QWZcG0R0p6loX5ZkSOYMyZp6IKEF87ev0xg2+TzoAkA="
									"stdout yaml":                "dkNb/Omzqr4tBvnki/FJjkxQvLhk9+v+9bArmwxXsZY="
									"yaml:-":                     "I654c/7orF7hzHnCBinaUXmuw0g0Wr5JLrLjoZhkyy8="
									"--out cue":                  "rdqdznlYGo3cPtzXu8sK1vAFrm4rFdwRgPFL5hJvjpQ="
									"--out cue no hidden fields": "XneEkEx+ao68f8yuW6K+nw24kf8g5vFrldbXOxzJTuA="
									"--out cue --package foo":    "tAy3ftP2BeQ83P1mDG/4T6IritZ5ZnRQjMXdqpfD6gM="
									"--escape":                   "c4bVwbaCXKjx7L3xra6MCOiUJol1Kf7MAayhfDSqBA8="
								}
								upload: {
									"--outfile data.yml":            "PDfCDUXNM1jDCr0ey10Nq75MOGjZm3JAjQ/zJ122WrQ="
									"--outfile data.txt":            "CJ1qtbQPgLbMwVOyM1RmH5eHpXOvFSvFnc39BHE71RM="
									"--outfile datafile --out json": "Bu6LEZqh7xqwmsoNCW3FIQIkgSgP1iHvOm/Vrizz6Jc="
									"--outfile json:datafile":       "+YXxZyCIfhydktLuJrGV7nCfDVTyDexWl7sCBj/uxf0="
								}
								multi_step: {
									hash:       "KG84P6J8099SQ3OJB5FK51RMEOR960P5N4ECRDSOB9CCGUDOC0EG===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
