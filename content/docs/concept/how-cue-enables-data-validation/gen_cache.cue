package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "WTzH8r5IinAqPUR3B1n7Ln2EDVKXhbv9yPJTeFCqYxw="
								"data: bryn (broken)":           "LdW2x2cseOYzfS5syi/SxGF33U7QRvd5wou6+e5ckaE="
								"data: charlie":                 "4T2hBsXuE14SxiF2QPeaIdsR5++7/N6hZVCPu3FkaO8="
								"schema: CUE":                   "EeyqhB5zwM0AOlzyxb31O9RpCu8XZVdtaV1vZ/HKC7k="
								"data: bryn (fixed)":            "829ECHa0CZN34Cq6bg9aDJ1IOVWqOZ3MlEvLawaQtyA="
								"data: alex (reminder)":         "YwkTpaAQnL3jeeXfm4dZkWNcr0yaSpvVx5/mvBUR/VE="
								"data: bryn (reminder)":         "ODyYgMl832h1RXBmdzmz2itsRsh7RfYwuSXMyI1s+mg="
								"data: charlie (reminder)":      "nobHEuOCHLtVfl5pVB1VjrslFeEvBhVwMxTA60w9OUI="
								"schema: CUE (reminder)":        "I/mN8mflHRcSr7dTzptwULDNOst9WdXbg369juDKLFk="
								"policy: CUE (too restrictive)": "hrVJOAiRF/QTQ6ydjtzahLGzfm+yeSq/qsWGFhK6fpM="
								"policy: CUE (correct)":         "gGc/z8iYDJUXNgds5PMJiF1Ufa91XaUXTm7q5WlelOM="
								"schema.proto":                  "OT77yPOlltzmpjJdXpEezroKNr2njfTH/7MwKb3dsAg="
								"schema.json":                   "0nmjNmJ9jvTD2v9gRgYCObo1dpIkykIC3sPqC1+7Ar0="
								"policy.cue":                    "OVnFSleEkDsu2wEQQvCxIUbPNhqPrjxQN3IzR1tdLm0="
								"data.yml (broken)":             "7l7MsYF5sKSagOYJk0Xb1vc91V2ekWyRhHyKD89/R4E="
								"data.yml (fixed)":              "B7k6WoIh8JK/j1XlTj66UcCuJBy8UG/g/U8PbRCh1pM="
							}
							code: {
								constraints: "vw6ueo2Dh3+esjLjFg4Nkdw1tTeqT2YzY4tPBvN3JKs="
								definition:  "BqvfZBwjYfBr3KuzXplsjbAsM19SiwtyYOXIDkr/vAg="
							}
							multi_step: {
								hash:       "C92PP6NB85GRC2OUVKRGBKK4P4B7B18V3H9AP6RPV6OUMND3I3K0===="
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
