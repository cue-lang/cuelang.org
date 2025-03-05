package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "uA7ywGd0a3d6L+GzhhzQC7ItOQXcvC4TgGloZO1GFfc="
								"data: bryn (broken)":           "vx2Pq33KjSfY77STpgGvrrdSoS6jTBrCGndX4KiWR8s="
								"data: charlie":                 "o1pQ4ita2DGyw9Sah+wWQki4FQzzRm66xMj556mzS24="
								"schema: CUE":                   "zdn+JEkGUMF/TuDfjeNUDmAts/2zV/ZuI5z+HTNZAR8="
								"data: bryn (fixed)":            "CzU552JZUfIzMI1HcwA5SqUooi/nF5+yVxyP9aZ4J94="
								"data: alex (reminder)":         "cDsgyl4n9Ose4F9ksAYAtaFC0A0Fy1BrAPtDDrklC0c="
								"data: bryn (reminder)":         "Rlx7nsYuDty3chdM0DBq8uaIqFJrGOEzTBDnI8uuIYM="
								"data: charlie (reminder)":      "0ACdtyfbdJR5ZlCP/F0KzrxaEH9gFZPsnYpf6mVpdRk="
								"schema: CUE (reminder)":        "X0CFSa7mA3SjsROP9vgWLCHLEQwCC1qjC46l80rkLiI="
								"policy: CUE (too restrictive)": "J68UT/uRltDJtwhPO/apGcSsnM1KBRrMg9enytORoN4="
								"policy: CUE (correct)":         "iwu5eos+6dN1q1votYbMg2SChZnRgwTbvJXeWCcIEA0="
								"schema.proto":                  "RkWykAgomMrEIVitSWosdUqgIvzgU/Or0Xmzdbt+8KU="
								"schema.json":                   "RTIIL6txptQprLLx4e0rGuIUpYkkvT4BR+o7HCq2QtQ="
								"policy.cue":                    "ypW+ssf8Gd2dvkiC174Uo8XBtB1+yeXGBvIBisq0/lQ="
								"data.yml (broken)":             "SWaK/qyNlw4Z0VnG/qtoegEgjhl4br8A4naH7+k5Ii4="
								"data.yml (fixed)":              "lUXhAPfCKEq/uTwEICQepaQp8dEV8QbrWLGMazO1LnI="
							}
							code: {
								constraints: "lRn+z8uTTYlPieliF7qggO9SJlwY5O2B5zofhEyrx3U="
								definition:  "pIbxLKwDi9fzc2Yg+77Tk1mEddf1zZoYQ/Co7TEu66Y="
							}
							multi_step: {
								hash:       "RK87N31VF9271A6V001TSA09OL87FJ6B7MRKG6RPG02DS5FLSPN0===="
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

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
