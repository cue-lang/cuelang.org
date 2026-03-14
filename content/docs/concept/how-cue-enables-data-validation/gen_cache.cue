package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "4WUA/UcmOzyAXQkyDYJcvn6fCZ9x55pt48Yxbpt25W4="
								"data: bryn (broken)":           "v6GxaIEzR15S0ZK/3n274ZR5FT/mj54fujkLto1mFmc="
								"data: charlie":                 "Ksu2EzkXUgQigj8xx/fTN0lTRugMbOO8ZRtgjc617qo="
								"schema: CUE":                   "Dva4CEZwoUWBZ+vwC2yxQbQ/s5MHejxDLHY/TIXfpG8="
								"data: bryn (fixed)":            "VCxdz5mujwXj2KA3+8Vtp7NwO0ew26pWMzhama6pNz8="
								"data: alex (reminder)":         "fGocrBDRcPc35nwD59RUqMt/XcmQ8mxX7TGS8DxS0Go="
								"data: bryn (reminder)":         "xCC/AEZryYmwmknDPSrHS2VCo4zUkN9pi8xYjA8DatU="
								"data: charlie (reminder)":      "s+ieIY6Mh0v/WSO9BeXHfIeqi1jMadC3qEhd6w5Dpzk="
								"schema: CUE (reminder)":        "Lp6S8yH8VkP2oKmZ/S+PuhqIZsYyZOiULEv428hAuZM="
								"policy: CUE (too restrictive)": "A+kvHOZZvVwdqe14GVCJAyyB5ejIWw1ev7VcoxFIGRs="
								"policy: CUE (correct)":         "KVyq6oxipCnCSp0PsWLBVe5ywk21oR+2FuNWE+yQDGY="
								"schema.proto":                  "+gX4TFQ2hvfp4NvEqJjk3eZlbNzZEBbufShERRbbfkE="
								"schema.json":                   "7H6UKidpURtM813aetRplzp28oQZUqCtkb4vhQhXsWg="
								"policy.cue":                    "+FdcDWjJHFcyQKUBH56rOLWU/HthiNDtlmJSpRaAxd8="
								"data.yml (broken)":             "/0lWHsq8iBS+NYVevlQWdGdgF4tNtwG2QDkJOPWK0Qg="
								"data.yml (fixed)":              "vCeeFcVsNaaj4L0UpJMM4XxiiOHDcwPri/PzzHYOqS8="
							}
							code: {
								constraints: "SUtCJllgjx1xrOZYWcptw+27rhzto7B8LBYTY1bTlzY="
								definition:  "E8Vc20lxJamGzO8aSHovndPGzAa/IYguAovCRwspLH4="
							}
							multi_step: {
								hash:       "VRSU535GT3043M14KR7FUAEJQG9TVJBT67H1OBJCJA5Q5LSEOBIG===="
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
