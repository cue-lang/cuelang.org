package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "s2z9y+Hhs/yYTBKbuEnRk8LXSo3uSw0K417Kgb7vWcc="
								"data: bryn (broken)":           "wPKi3WQ8CjAYkWGH5/JtgWTwpZRLQlOXBNK9CELp9r0="
								"data: charlie":                 "Gbz67y2YfQ+Vy+rUH/cgTgdASs6p8oWXXTsx/5EGm/4="
								"schema: CUE":                   "koj2QC+X0gjYCZM/mRvkHlDyLofAHxGJJe464H18Qdk="
								"data: bryn (fixed)":            "0ulAVQPvf4q4E1bzvQx4toFCy73n2urERhkguwGhRjk="
								"data: alex (reminder)":         "d1slT3rG6VvI88gWpsA5NJ71vZU68Jaam3lriOaUDrw="
								"data: bryn (reminder)":         "eUFx9ztKw2l4CEX0Y6GX8r7oC1uT94ur3Lps6zRJtYU="
								"data: charlie (reminder)":      "Xru/+NVL/eZH1TanuKqziirL+fKKK/+OAPOUSyFhjeI="
								"schema: CUE (reminder)":        "CP0UfjsLjE1OSL9rTTpIRYSL5ssBoi60AUyHZq/7zEs="
								"policy: CUE (too restrictive)": "ugKwIZjZ9ekvD74PrOfJf6+qm4iuBKnjGJRVSfRlxMk="
								"policy: CUE (correct)":         "jWNG5QNIl7bHAMEOO1IoQX6QFuRABFumL+9mowxE5KU="
								"schema.proto":                  "QQhPPC4Bbr/dH28DSaX7pmvlVa/a/xMs2L/d3vOhVaE="
								"schema.json":                   "CuIHoGEEkEIn1MHJj+f4uIK35UBsUZMgphDmX+oyw/w="
								"policy.cue":                    "vK4NphWPs5pdG1RZLbkqJ0EP/9LM+O8tog4Wq8INEi8="
								"data.yml (broken)":             "ZnH0B81LL3FGgZeZaVz+Sd+0wFstDyrnYHxe1IL7Kvw="
								"data.yml (fixed)":              "IU1QtaHr+L3T4MByAZe5CBTFgMKtR8zUgSPG6NdRa34="
							}
							code: {
								constraints: "vTEwMPsK+TKqL3nPmlNFCBdr/4BeEcTsenazl8Joa0A="
								definition:  "7LEQnpSCCOga8TxexeJJXInR/SBNObtleT3dOaIAH0k="
							}
							multi_step: {
								hash:       "0CREIHQGT5JCAKC88PIB82O3RQ52D4VE4C4KA8SPO5S211JNGCSG===="
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
