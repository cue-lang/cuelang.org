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
									"default output":             "/bVI2ydPTcxAAHYYblKpoJ5ViyZQ03+VpzcSkdkDphU="
									"stdout yaml":                "jljg8oJgoH6pne4DV4jxCeBTpdy5d1h4PJFBtgP6XWg="
									"yaml:-":                     "8emO4aeDFteQpYmXi4lQ8nOMry656FBQqq7cJv8hJV8="
									"--out cue":                  "uqbDm0d6TyP/BlrbFIRbjeVlhAiuJ1P/+qThwaf1ins="
									"--out cue no hidden fields": "F0Hgqmc2VETkH5C1XN9gdkf/Jxu4g1AgV6s+7cASxFY="
									"--out cue --package foo":    "Skm+FjKJJH3OD0UMqE1UJkKB+uthul1hX5aNgJdjI6A="
									"--escape":                   "n/rHrvIuBwgYXa/QAH1XA7/IAmC1+7+s2kSwyly3lwY="
								}
								upload: {
									"--outfile data.yml":            "nXjbv/a4uQg7qur86GcPYYU4rHHPxGrdYv4JlWGIOwc="
									"--outfile data.txt":            "or1nq9Vjfjy/qKMdcxfWgA23rgb6IJROnSi/WgsvZLY="
									"--outfile datafile --out json": "2fad0TIt5XsyGlPShrF0R3hmjdWt9YXdBDrAIcG8dvA="
									"--outfile json:datafile":       "wvY/EKtysWIibc/UQSgU7bn4QmWTTY08BTvKGooUaBU="
								}
								multi_step: {
									hash:       "VOSCCH9NTTJ0N36JNIRPTNVNMH7JL5ERMINPCEPHH4PDA80IDBE0===="
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
