package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "tGFyZIDGXvXyMjZHxkb4I9gHXdbouX4hLbAVD9JeKUk="
								"data: bryn (broken)":           "W1Qf5OrWpK7AdsjfGUSl5TLd1CK9Sv1nWRErM0zIR7s="
								"data: charlie":                 "q7ErYcNcYD+t9DZRiASlGktVouCzXqqcC/h/yjM1zgw="
								"schema: CUE":                   "flG2Fo7h6QEdys6YGB3cMRECIVbfgC2YD12SaJ1h65c="
								"data: bryn (fixed)":            "8pAjnJjzVmvKyBapoDChIBV6XgxIGXPIBRFvMD1pZu8="
								"data: alex (reminder)":         "Qsm9Anu0olSSQQpPOziTk6oAQ5Lrq7F0QTJSZxdQVQI="
								"data: bryn (reminder)":         "e/Q2uU69B9/q4rNAVUyP3XmW2NL/w+6Y4Kz6o4basPg="
								"data: charlie (reminder)":      "D55cB1l9K+UBNtzgyZjIHC6blEyOPpkp3Dlel3h8eTs="
								"schema: CUE (reminder)":        "4kVxngeiJbgT3n7uGW1HDkqzPeGx9CROx5kKR/OG6eU="
								"policy: CUE (too restrictive)": "oYkiSiUKjICddzLkCmygWZksNnC3YjWzih/xOJqRT1k="
								"policy: CUE (correct)":         "rp5ni/yzsH7UYHStt8AYUIFoGZwYMKGyfn7f7VqekkU="
								"schema.proto":                  "c6+MAHVcDln44u8WTTxEipC3XMeGkG5nkcsGKF/vGZ4="
								"schema.json":                   "n7iLryVWcuuXBtK0tjcGCNmryv5OvJiT6CWw7LEs7nI="
								"policy.cue":                    "kE69XWJlQUdUM5DsmV0vEJtgh0dC4tKTGZpaqnB0XVA="
								"data.yml (broken)":             "Cne+NmPBx28FZHcAZthBgMUxucg1nfs8Ci7g7GKnNq8="
								"data.yml (fixed)":              "rLGlSNzqbvZOBADTpRjjL9z1jgWFHmfwd4yyPdwSYO8="
							}
							code: {
								constraints: "6oV3bYLIKBh4SGMEqltW4l/BrFtK0ctmIdVFkRHG4Cc="
								definition:  "Zl5oUDM79qMCmw2J2ohKnp+VEetQNe4SQvGJE4Qwt7Y="
							}
							multi_step: {
								hash:       "V6G8987C767NOLE5IENFRIHDLE2SS0B3MN1G95MMVF4AV2OJADKG===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
