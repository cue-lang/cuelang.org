package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "REG/GykGe88z7SuyIO8YZYGnTWCS7Jt/K59fmwkqwh8="
								"data: bryn (broken)":           "Ct69TUxl7Ed0KgGtTYEHdRmSM1mORf9ZmYGS0F/1xSI="
								"data: charlie":                 "b40d5G8TDstIhBxy63O5cM7ha3HSmYFRD7Lxam0EWmU="
								"schema: CUE":                   "ClfmLvYNJNTKO9uu3dym4vPo/6mofODnFCsUP5nS8O4="
								"data: bryn (fixed)":            "GoUNnhm9ulD1cqAK7JcZHD6E+xIDAsipcKHZaF97ok0="
								"data: alex (reminder)":         "/f12V7S9q3gyCvG9RnBj5KogIbDse6fp+znDQDWnXS0="
								"data: bryn (reminder)":         "f4VvTrDk8/z+CMJU5VLyqNqwpuLyQcvq+fujlhAzYCM="
								"data: charlie (reminder)":      "WFNG0VtTm/hkgEiw5cb4zXez6+qWW0c+SoyS3KU5qbs="
								"schema: CUE (reminder)":        "WIC/B8NG4KmQlWWFDyKcZv4jXYBAi6FbvsKJGxqcgCI="
								"policy: CUE (too restrictive)": "RKXH3BapEKGAt5VVSEDwPOKIIWMkYGjpLrg6HL7HZ8A="
								"policy: CUE (correct)":         "AI3Qx9RyE6m54SRx4Ek7vFnBMKogyFgsmdHkglPSahg="
								"schema.proto":                  "GkSCF/BMDtfeCdVRqdbqgyTdRW66knaT7Lmf49or6qQ="
								"schema.json":                   "9wc548Hh9UzQMb7R6RTH/Hy+nTHOAPnLnEodQYLSuHI="
								"policy.cue":                    "D+qtTwaR99CJTT/evCztyH/xkM6gXycKWnfEYNQhe8U="
								"data.yml (broken)":             "S7HsXCcLllwKfDRtYAHqEzcT0s56mEvnfnE8gEXgZv8="
								"data.yml (fixed)":              "n+Q52soyf4ftQnRGq9EJLZqKnra0/jAf3vrvZHXcMfQ="
							}
							code: {
								constraints: "BcNeM4662dYIYCZgtZS0Ynk6S9hW+ctRMxQ7TpVTrb8="
								definition:  "GRkpZJ4xbdvwssZ1THW2Ls3vlVuU/Qn+Dpq1/tHTF20="
							}
							multi_step: {
								hash:       "0JF8R93BSFQJ1VRARUDP450988845741K3T17NBR8DI5DJAI1M90===="
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
