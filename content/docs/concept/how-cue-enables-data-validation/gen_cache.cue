package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "IfB8RX4kckgLng2haoPTCbnDVB9zHh4tTI2LUcJjbvs="
								"data: bryn (broken)":           "/rUL9TfP/vUBWgclWXyP4okrBX7DJURNLp7ASTC3uRo="
								"data: charlie":                 "Xhr1ztTlZzMSom7Z8INyH1U/aHDsLNANOmEYc5FTGRE="
								"schema: CUE":                   "i2a4Ujed8UlHq0igb6fxA8PGis72n8XTB78CX/Hee7w="
								"data: bryn (fixed)":            "WCJ8U7t00P7cMSXOy1Gk684TKV2nnV8srMgEH6lAGBc="
								"data: alex (reminder)":         "tTnrWGWzBsFTj4tcTpzB+cMvp5/yL753LS/lox5zKAs="
								"data: bryn (reminder)":         "14amUWczin6zi57DJmAgX+ktgsqxlEmn1Bm5s4G7OxY="
								"data: charlie (reminder)":      "mQRkAjSqe8vYTmPyT8lzNbkWRnQQIFWHWFl1yzbK9b8="
								"schema: CUE (reminder)":        "hiF0tHmsvtmVXRNAZBRy0cUD3tug5R5+so9nVMjoogM="
								"policy: CUE (too restrictive)": "JQp3eADVllNHBSuSs+pUAtGziZUvJ3smFXh6zWbh57k="
								"policy: CUE (correct)":         "faXK6jTWYRVQ4klBXdmYiNB/ausxGRfoV8VhNnbD7SE="
								"schema.proto":                  "HnZnUoHThvC8AiVL07BwwKedGk3RVWSYawdBFoHaJSU="
								"schema.json":                   "jS70Z2F4TCwJtZL4zoyknaEvHaWVpz75F0ib0l1N3I4="
								"policy.cue":                    "pEmvgYjpouU11IOuASNxN64qIWm1pi3Yf+Idm3ty078="
								"data.yml (broken)":             "xIOaEc7cqkjsu7ZTGn5SVh9Mtj7FQRVNslVB9419KF8="
								"data.yml (fixed)":              "AWEsPOy3HuUhc+Rnw+1lRy3JD3doEdlDKbg909LdHtw="
							}
							code: {
								constraints: "RGyUVlpd20FgG2eH/xKZa+BHRTWk9ZbEUlJsvEhz+bY="
								definition:  "klDaSo/z/YnbTCFYBKYDLW3rbAadSAy0MHjmx9AoiP0="
							}
							multi_step: {
								hash:       "2GBI7BV4JN6LJ2B9K4A526EDQ6KV3GTPQP28O1S4QT5KGQAMBCNG===="
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
