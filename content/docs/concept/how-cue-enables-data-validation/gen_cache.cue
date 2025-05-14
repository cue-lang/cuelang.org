package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "oUR+uUh868U8NHidKVqQOEpmn8qLIpLz1R4AzPJI6n4="
								"data: bryn (broken)":           "OpG6yT4UpSmQ2g1axB5HJ4XSX/AXwP17xIgMj9IO7Ug="
								"data: charlie":                 "+/GQDvJO3CZRPelhk+uSqi2V2s2E2iERMLprqGm4iQ8="
								"schema: CUE":                   "5jg0LD4PK8gf5cXfhYhwOTNTB3iw/MQnlKiyoHEKnpo="
								"data: bryn (fixed)":            "oAh4W5FlMSVh5odQI5I9JElLOfQGrqRPSs0nCMSW8hI="
								"data: alex (reminder)":         "px9NHt9+mlKaaC3iubJeL3i/A7kglJ1ZvYNjW+Cld4s="
								"data: bryn (reminder)":         "WfFtofcyo+bhjGWtFB6nb0aa6SWkKvhGAM1WskGWMjY="
								"data: charlie (reminder)":      "zEMDLJv3Mi+AaDBqRBDIGYT3Mo3oKdVYgvbpZcb4XTQ="
								"schema: CUE (reminder)":        "HUMyenBHhKeb0/0mHb9+i4YBD3GGHGaBLSeqF7Jet18="
								"policy: CUE (too restrictive)": "H2+LSbt7PYFEvRO2B9driMge2NiLYMs9m0oQzwVI2bM="
								"policy: CUE (correct)":         "d8/hBNSJRZqtzwO04daK/E3fkRJymGB9im42Cpbmjnk="
								"schema.proto":                  "Yf5sM4xa/i3XLf9Zbb3Wd/b5dUmlrd2wnw7LhmIaEN0="
								"schema.json":                   "FcefqzyUTUuHXnBaDgv7NNET7PikyUtglOximaeoPY8="
								"policy.cue":                    "r4vZpjezf8rSkaqVKG9sDB6/R4iUfWEtChgO1RF4l5M="
								"data.yml (broken)":             "0+QNN0QTPVAzCwC0AKd5U+edBBaJqfJ//uVUAaIhb+w="
								"data.yml (fixed)":              "3EbFPDzA9fZAAPUPK3kLzvfujmuh5JO2+QQuW8fHesQ="
							}
							code: {
								constraints: "BXLRp1roEMvFyD4Pu3onTb0q7PGGYtIOcelaTeJ5t3E="
								definition:  "0A8G9Bt3UkpnNFzoRM81Dxj0RCtT4TjET2UiUzA/g/w="
							}
							multi_step: {
								hash:       "G6VP58J79V1H3JE0ARUQ3Q44T96IP6K7345VPES1BV9SKCCK1GH0===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
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
