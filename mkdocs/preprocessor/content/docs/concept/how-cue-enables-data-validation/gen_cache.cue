package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "3uPliXVBhPVmNivPmZX4bTgKO+5IeJETWu5ga0N7Xvg="
								"data: bryn (broken)":           "QTrTrSdq0tAoL8sUGokYIWGOg7vS33+VxxMDYf9igvI="
								"data: charlie":                 "Fc3j0p3hxse9nnHctpgvQD4kloHB1CyYDrgTKCmuUno="
								"schema: CUE":                   "Nlgw3cr8FXK5ntWWMP1wKVYAJzuk2B4F1U6wHZFT+nU="
								"data: bryn (fixed)":            "1JCYyKWvhPg7NqVU6s+om36SwtdJE85j3oSJVYEHcEE="
								"data: alex (reminder)":         "6Ab2YkH9rmBvPxehMYqVrubikWqWaHEhk/o+s7SxQKc="
								"data: bryn (reminder)":         "tJN1NVdTFpyWD/PHV5K7hNFPvNJGsbDwrf6pSwNXWLQ="
								"data: charlie (reminder)":      "JybV0rhlC17MZk8GGhpkEMQsmDKWEvsWoy9mjDqaSw0="
								"schema: CUE (reminder)":        "Ge1QEjtqTQlwl4nxBsfkLo+ltboj+v7tdApNPL+ysqE="
								"policy: CUE (too restrictive)": "XJO0DsGyJ9IGFyFM5kKuiSzlzbKX3ddfnGvbxW/yQf8="
								"policy: CUE (correct)":         "FEcYfLQMqjU9OTEInhdeIYzWiMUf4bmZbjpTSZrOWqE="
								"schema.proto":                  "N0KhQgOjKI2h2XKLtNQ65tqE161SooQTjAwdc3GeUec="
								"schema.json":                   "7votm6lBRnz64/RYiXPCwcjwtthAoXrpO28yftOopFk="
								"policy.cue":                    "9bRFhSJRlOvbrb6t8Eudg9R5SSjbM4+JzSxfcDtFyEU="
								"data.yml (broken)":             "Atjwer24mPNIsx4JzXK+46KtIrcdKrdzty51XMay1xU="
								"data.yml (fixed)":              "ufJK7GTkt9Cip7yPPhbSlmJM3SeYt24KKB2WZIkZHyM="
							}
							code: {
								constraints: "aTknwOQC97/4igerqN63tqogwm0OZFd4i92Xnvx33+s="
								definition:  "x/6mIarbq+Q2jsX2C8CxOs1YZsZ93sF4kuMEMH9WXFM="
							}
							multi_step: {
								hash:       "H8T2BRCR5077UINF9VP4LJ03735SQV783H6ONRMG5K4DA66REL0G===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
