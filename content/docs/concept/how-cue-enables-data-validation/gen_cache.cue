package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "/EE8xa+aJl79SS0QKdRYZwgnnTavt+Q/PkHYZrLAhtk="
								"data: bryn (broken)":           "Ce8IavWHy1TLtiK3lQtiEICzxIyQeeTZq0qG21lmdDg="
								"data: charlie":                 "7Yduea7vk5qTFOaJsmNiytCLERcXaqet5m3TL9ISNds="
								"schema: CUE":                   "iDQfNHeJb8z5wU+V/qJ5M+BH7F9noY2uW4KyUjlcAhc="
								"data: bryn (fixed)":            "iGaZSEQXFaBrcOhSZyL7m8AmP7hvfsE2zdzviKqGm9Q="
								"data: alex (reminder)":         "E0amzZ4ozNaF//Inrxo6/cqcTr6SzHTij9Co5Y3a+9A="
								"data: bryn (reminder)":         "h0EvZlIQp/i+m3rxklTFPMLa9m1yAfsy2isSI546CLc="
								"data: charlie (reminder)":      "2R0eVU4kITs5lOu47UBFBOadWqj0TReB/7yIB6zqM18="
								"schema: CUE (reminder)":        "hdhJYkZVpLPKzDdy9AdU0SLOIPMEIPtVDGAUqGBi+LE="
								"policy: CUE (too restrictive)": "w8i3mwN+XtOKJVaj7sYGMhw2GL97VvuOeRbuKf/TsL4="
								"policy: CUE (correct)":         "Wyo0NgXJXePKLtSL1JA7BW0aiERZ8l6DX/Cp5bOd6bA="
								"schema.proto":                  "3wg60eEG4uuiPi6PmrQIWc4SW4eTzAp0CTe1fngpu6U="
								"schema.json":                   "RWvLYtKZCVmFNIHqUN7fu8cLCbAC+Hte7gVtNqJU4LE="
								"policy.cue":                    "M7LJea8wc5zq7ubWQ1NQzTZTlRO9anSTKHFolaViQxk="
								"data.yml (broken)":             "ne+q/uQ8GnbmflJBUvggbXl+Lz1fxO+k29J4l/p+1fk="
								"data.yml (fixed)":              "zTXKI0UcyOaIHP2E2PhCMUrtlBIYFOW89iHmKQc1Is8="
							}
							code: {
								constraints: "F0+6SKPEl+qhvbYKQQevPRLpzwZyp2yAxCmtsa0v3lY="
								definition:  "dTj5otRm1vlNZK2Hc4RJXhtXyLRZ3AYdozJ/s/k/jtw="
							}
							multi_step: {
								hash:       "0DTHEBP70H38GJR3KH4PK5QAIDCV6H2MG121SK811C4NL6EGCVKG===="
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
