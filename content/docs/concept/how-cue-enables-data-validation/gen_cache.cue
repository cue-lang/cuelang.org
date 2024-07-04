package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "3B/UmXdbcVafbD+YzV4rxh1Ub4Oo/1qnyaF2GBQQpBk="
								"data: bryn (broken)":           "udS8iB1Y2P4Br2pJeZHr8GLOzUe0y4FIFP2joD9WkHE="
								"data: charlie":                 "8dw8UxdhnPhbX8jhZiWIOG+DFW6KjcjgCbYO5h1wTsc="
								"schema: CUE":                   "KNbzu89ItuNSsGBVdsdrp8l0bIKM3vjuYq92kvckLOM="
								"data: bryn (fixed)":            "vw+ax87ofUpVr+/AN1RBCTeokLe40XN7wEQLDkSKg2Q="
								"data: alex (reminder)":         "e1St7xF6ikTG2Cjz421AJ7YOU6v8VJpGmg4N4juAHzA="
								"data: bryn (reminder)":         "AWP2704BGYjV8IgnygASLhPsfKvrOYFntx6yh/yiM0k="
								"data: charlie (reminder)":      "4NKwYjyjun1vSXiqwHhhOzv8uZa6MU0cl+l5AocabHY="
								"schema: CUE (reminder)":        "6w7HMQ/x/m6je5603DlzfX1SlCE+ANmrKKCiagDfXGE="
								"policy: CUE (too restrictive)": "SWAb/KZCB/d4IDvqRS4KIR3j6g4dIrEUtr9Ir00+0/M="
								"policy: CUE (correct)":         "DQG3dFqJWqYZ77RZV4cO0jPemY6s27MFjogyblChPWY="
								"schema.proto":                  "gN27fjhhyskj6W2vcGTCZdvW2G/gnLaNHCP/FD/CMi0="
								"schema.json":                   "oaDtD4bpbHLbVvaoh95PAywzll5Ei34vjq5+WllMAP4="
								"policy.cue":                    "SXa9Hl8YwUj0JoLLFPIG+mU/GDNGhaeiuwD7EIGNXgQ="
								"data.yml (broken)":             "yaDmDmYJSIcLU3e1+LEIK5Njonv+TZXaMD6/q4A+RwE="
								"data.yml (fixed)":              "Xrf2EAGqugwqUtTeSxAqPMZfuHG6WGosuODFPtSvzoA="
							}
							code: {
								constraints: "Cp9mRVcnw0TwAp+pOvoufU5e9wIbx7IRJmOwSPIxyp8="
								definition:  "YoiQnxVUXqdQOUUCnIcJCLXzrXnSKBDM2hNh/SD/OTA="
							}
							multi_step: {
								hash:       "DEHVH9NP4U0PCH80V24B9I8E9U7J38VDJFMR2O3QIHMMGTME6BGG===="
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
