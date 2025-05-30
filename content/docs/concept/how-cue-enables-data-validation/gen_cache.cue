package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "f1HxTvYm/utB/UrZSypwCeGy03498aBNWwjNOC4TLKE="
								"data: bryn (broken)":           "J629XWYb6B8dbygtCRzdy0/7yn9mdQHjh5DUrwOnhf0="
								"data: charlie":                 "1VfUJ1xdKZxTEvt4UqqtWM1DobZTQ67DD0SsJYVeSfA="
								"schema: CUE":                   "JYRdNagqNRWCPXPCYpQkt1BE7Gvch++TFMtQdSYn82s="
								"data: bryn (fixed)":            "fhECfLMn2DDEbp2uEa3UzbfGMxPBgDYIUrBv7b2BydE="
								"data: alex (reminder)":         "4nRXp7a9HmH5RVv8vq7IhmUwVvJ8sOU/aT2r8RLjWfA="
								"data: bryn (reminder)":         "kZgKOJsYWoJP1GaMP52jlF9AAHZJMYtr2pr0V7BfPko="
								"data: charlie (reminder)":      "n64qpHw9STdh4DUbmDiksPuUajipbbUIogbwBK4tWwU="
								"schema: CUE (reminder)":        "akqafQoDRVGyl5brjOIpvNIyGrLnsP2MWSmkd5MguEs="
								"policy: CUE (too restrictive)": "2gEqURrF5+ldgp1m1KaH6VVnRsIL8JpWTmO4/YdaDWA="
								"policy: CUE (correct)":         "TvwoKta5GWgtK81ApyFwN+RD62IgllSNltwnjJ1nV8M="
								"schema.proto":                  "tElCmPj0b0qvKPCZEGEcPENv2R0UCQFJF9Q0pgwvrA0="
								"schema.json":                   "QY4rEQ45NuQJyW/IxaFpJU9ySzlbYSMA7WX+w3GT0FY="
								"policy.cue":                    "Rl7fdCJJja0mN7H3yjCu/nsRfZW/W7nZWu5yPwrkam8="
								"data.yml (broken)":             "JeBVD6odY113WwmGPTRTAP4HqxhhxEpNN6Wl/7XRelA="
								"data.yml (fixed)":              "Ad2FWq3PDZnzOvDpupdXQDpoWXpo2gjRe35h5209MtU="
							}
							code: {
								constraints: "yeYsYGc37170g/lUxzdENet7ImBRTKt/gyuUbCT4dgE="
								definition:  "II7Q+QvCLWMqNw8TyHHOf+uEKnl1yL/PSx8Dq+xsyAs="
							}
							multi_step: {
								hash:       "PU0O44917GOFPO4Q9SMRCAFA1LOTATVPLHFGERLIO9QF67O83B7G===="
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
