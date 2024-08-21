package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "RRAtNYY/fyyghI2LlZ9Io8hSnBdBLljgd6jr7TL9Dyw="
								"data: bryn (broken)":           "FRPR2zZSEKFFp4wEqpFGegO3Zdi0NAqCnGrKXh/PGoo="
								"data: charlie":                 "FEqfKXeW8ItLfR8Sm0BWzxocuohLR98GjJx2fb12pok="
								"schema: CUE":                   "14KkirDEEak57PpdFcA+F3AiH5vys+LJqYiPzNAS/Ug="
								"data: bryn (fixed)":            "XG5Q3wPS+yRvhuQwEhBli7hPe1vjaVGXlP1EU7AM6fU="
								"data: alex (reminder)":         "cCmgAeTE7hgM44wmTIcSBsy2et5Ajb1HPTFQ2J5SvJY="
								"data: bryn (reminder)":         "dRAXljLU7MBQO6sUE8pNuBgPnFAEvLjCDzMBhehQh14="
								"data: charlie (reminder)":      "lJBmkZmeKU0LLvr6rrBE/rewl1WX7czSLHin6cdpxSA="
								"schema: CUE (reminder)":        "ig0rsPo+UMIs8lvGhoIjWRZoW4pNiegePG00uvjvZcY="
								"policy: CUE (too restrictive)": "Ie2AbDSC8p/uOR9u6cYU6Htw+9IdeNaKaAm7H0XrnqE="
								"policy: CUE (correct)":         "IUdk6UHHGr90wXHDXugln5juS0iqnX67J+vrc2Sf4KY="
								"schema.proto":                  "WgpR8lPO/ItzH/CFgwNubqkSh0FUU1nR/vyKssFgsw0="
								"schema.json":                   "sVmnAQdqS9Vf3gejiTM93KB8d0wF5Nm5E7rky1T6av4="
								"policy.cue":                    "f9qVfZGXSHVDCjJCOuW8D7lj37pharPgfyMjlRlJ0eI="
								"data.yml (broken)":             "oL1Tjaa+uo56jyTqvFHmJaCCZYW7Tw97SIdEMNSnbww="
								"data.yml (fixed)":              "Ilc5pQi9xrjIXpVsG0svuXWij5nHDHB3fAC5GRqRPIA="
							}
							code: {
								constraints: "2RA03eFyWURK5JxWb2/FekaHJetxw6Tn7kkZS5UywJM="
								definition:  "rTtLwdUM4SudOrusC+25PkBaPweOF2Wn6N7Wb4ASKG8="
							}
							multi_step: {
								hash:       "9S7648L8M9FOUTEUBCEJRRUM4PNR8EALECSE656CGGKDIP9DVH00===="
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
