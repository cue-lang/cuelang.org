package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "MVdcc2dsHYhNeL0R2F+jIyZowFPNuQkYJ1Uh3YFOsS8="
								"data: bryn (broken)":           "bo/au4YFX9fRTCfy2G2gWR6Sl79capcLhgSTOHzWB/0="
								"data: charlie":                 "Uc96uE08LWMBAVXXyd3bbIm0U9V9IohOqnCbapGURZE="
								"schema: CUE":                   "mp57vDdi+MoqHQdqSEBEZLU8Z1EbpBpdH+QKeJomCMI="
								"data: bryn (fixed)":            "sT8YSuNjsoPH9D1NeB2GV+Rufr4kHNk5euBgZN6YF/o="
								"data: alex (reminder)":         "lRpgukAaUENgh371gHo9INVnjwoXhY8Z5ivwcu5kubo="
								"data: bryn (reminder)":         "TJeLThnDJfzzjw6P7EmRAfsHW1LD2UfYTtlBhwFin9k="
								"data: charlie (reminder)":      "okhFLw2/GBaCum5GWVK0T8yJkHPTXcFYAxyf5DSH9ks="
								"schema: CUE (reminder)":        "G3Wx3M0DTaL3tLM16Spqg+73dLWEICzI9PYpiWnTIEs="
								"policy: CUE (too restrictive)": "O8OSKDNq+tpSrkcLtszIrw1xyO9Xqk4GTLRjQe/O170="
								"policy: CUE (correct)":         "TXLhXinIyApF6yCgon9BlmmbnPulhIe8hUMRBp2oJJQ="
								"schema.proto":                  "fgif5G9on8qyvSSA1B1bp0AI0jQsfrgh93UzzB8z9kM="
								"schema.json":                   "HqUzH8kJvSFLbBi/ncr4uNZJse0eP2W/37/kr1x2+O8="
								"policy.cue":                    "ezIr7BJY12FQJZ3OPpE3n1eOY43v+ij4K0Q1BJNwYdc="
								"data.yml (broken)":             "tcW9Omp7Va3PzD7a7cCZ8dMKOZmFXgPDJYa3PCuoZiY="
								"data.yml (fixed)":              "WDnBIOFM1HoTq/5/4ZnYZzZXx5G7PeAGcowxIvPzMc4="
							}
							code: {
								constraints: "8YhDVxXMcHyaHt0WodCXAfcmkiAMMlhBt6Fte4PZA1s="
								definition:  "1nuBV2+H2rWu91u2FR5Sg8VH0EjxiP+zaUibe66IpXY="
							}
							multi_step: {
								hash:       "UU57N199DJKA74AA3B9N97B1BJITKP2SFD52HJN998IUDDURU60G===="
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
