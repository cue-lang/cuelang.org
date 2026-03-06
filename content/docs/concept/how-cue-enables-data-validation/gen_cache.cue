package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Wm2+OCxOvNfL3JEYlfMnyUkaMBmaEe+ztjNCYRdnOuU="
								"data: bryn (broken)":           "wHXSOqF99Zy3hrQC34Efd8knu8E9Pn5zMKcke/G97A0="
								"data: charlie":                 "+JriP9LDODPFbZ7SihG9BakyFZXQCzAY2Xsy0maJxn0="
								"schema: CUE":                   "RObpyzoO4wSuS+3OpE53pg0oY+08u9CErL4NGIJno4U="
								"data: bryn (fixed)":            "I3XAKqzY7NDm9IetAZsEdcS7YHHg46/hFbnCURY0zb8="
								"data: alex (reminder)":         "f+CE4nm3F8qCLG7KZPne2w8NL73/IFr1h+vsN/E2eNk="
								"data: bryn (reminder)":         "iZo5sxrsuRBFYXljhqaOtChPJZevOoUqs3kExXvDW9s="
								"data: charlie (reminder)":      "sFn5H9B4F1igNj45E2oF+A5NCzY9pSjy95Ay9Ehr4WM="
								"schema: CUE (reminder)":        "jOM4keUPUnVWFsLSKUTk3M/Uad5xoxbVpKU/ZX+jpp8="
								"policy: CUE (too restrictive)": "EuffOAXz3xIMurkyX1Gpul7Sk1ls5atc5E+A8bBHKHc="
								"policy: CUE (correct)":         "fGEvuf4SL+ibw7eWfgzVYr8iptRSZNsnpnA884eZNb0="
								"schema.proto":                  "erNk5B7LLZNUIdTJNir/wfkDmsjKywXDmh6f08HS6nc="
								"schema.json":                   "qu0PV+XKBgJwyB9htAuU+4387UunkCTfyOpLoCj4o+o="
								"policy.cue":                    "mSgJ2PoIBsvZ9ZyS6u/9jg+cWZR03ig+RWvX/3qWcHU="
								"data.yml (broken)":             "Zz6LAiceMEhbUA+KWpizIfhp9QUuNeEO/i9bBXEl36g="
								"data.yml (fixed)":              "/3uuQdU0t1ub6uZoch7QxdIvjmB8Q+Yp+7MktSMnxoQ="
							}
							code: {
								constraints: "32GWsRThT/zILNyRwmhgUGvHyDD+RRANRYGNVtEZonA="
								definition:  "kUZHCq7DsQwsRDXhRVxGrPK+g8iNDGloDemokirkC5o="
							}
							multi_step: {
								hash:       "7BS29Q5RD72865410RDTIM1OVE87N5C9LF18CDSJQ01DLPQ4E420===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
