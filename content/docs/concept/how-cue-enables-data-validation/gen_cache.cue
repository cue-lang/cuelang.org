package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "oSxNhYWqLc8Ym6mUbPBcnXncJAOXXkUIuk4WiWoNGy8="
								"data: bryn (broken)":           "yoEl4jJwyigiWS42eqL6PJYrHSKoy9UxHwGbtng2jug="
								"data: charlie":                 "yn0llhHjGYHMgo4TfSw7vdboR135uCCGJTQkbp07+Cs="
								"schema: CUE":                   "5AhlZIGvnhAxEI1X953IzwPOgMLoVDYU1EMmtCQa+20="
								"data: bryn (fixed)":            "Dpm1Xf6YeHUhdTG/mJseeQPNIEOqTD2oijwkCxm66nA="
								"data: alex (reminder)":         "RCAvJrpKBZrRqPLvVcnAL9ZKspZmxEPwREkaiOG77o4="
								"data: bryn (reminder)":         "kBwZ108IesvZcJi5rDUOybXw+txFBIdMaKjZTejxbdo="
								"data: charlie (reminder)":      "1bqzMGWXEppJKRM/trYsJUaarTMjpCmszXR/T7rIqD4="
								"schema: CUE (reminder)":        "mNFCn/+YNE6/VYqZUkK//aS+bNIylzFQnOPLK1v9SP4="
								"policy: CUE (too restrictive)": "15IHh5UdIod4fkJ/q9c37iISQZwg4EhUK23DgJhm7Mk="
								"policy: CUE (correct)":         "z+xPHvBlXjEoG0yAH0Jah/GumA00ttYQkiLYTp7CqJk="
								"schema.proto":                  "XR+zwqMZKD97tbmbn3dzL36SRolsd+C97BdZIM+Zem8="
								"schema.json":                   "06j6zEN2h9oQkNqYDfKI3fP4GYLlnnR6mYbpWUzFe0k="
								"policy.cue":                    "RLyZ1D0nn4s5avZ1Zsrc/uMEo+/Bqy+eVJXq79FiZXY="
								"data.yml (broken)":             "gCNcTwqq5poHpgW3I35KFlWOQ8wRLDcjyIH8AsIZQ3k="
								"data.yml (fixed)":              "TU9G0WJbGclHk9UmS8mdGeeeidmGuP3YZ5bTbCa9LzI="
							}
							code: {
								constraints: "KNe7+gcq60HYd1Jbqod8sWJ0O5+xgn4J4qXF1KRPRqU="
								definition:  "m0OUVjZblXV1ejEclCJ1VZgU++hxytLL7SpVkuyrrUA="
							}
							multi_step: {
								hash:       "6DB9AFKA0NF9A36R5VNCJGV0HFOJ2HTPP4M4ASCSK0P02H0HNBLG===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
