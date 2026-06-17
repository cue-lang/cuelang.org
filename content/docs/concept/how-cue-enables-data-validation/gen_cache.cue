package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "oQBQNz6HyE2CAXr0lJzWRZ9ql8Df/idEeLT88HxXHis="
								"data: bryn (broken)":           "Ce6blijonoeS/Um8e8dKqZdPDyryn9YZsLhlhh+HyEM="
								"data: charlie":                 "1FgAuM7qomdlgYFKIS1Eqr2dWzHmC2MbdQxLz55uQIY="
								"schema: CUE":                   "1rPY1SS03pRwH/dGwUIBMqTIKT2KYy9m+31DmWomLkk="
								"data: bryn (fixed)":            "rHHxb8wQvkNsEDZtEx0lwW7DF0tyPNAjKO0IY1y9+pE="
								"data: alex (reminder)":         "UCFRjBviM+CZcaNKaodLWh7U1e4aku32UKY2vWG0y54="
								"data: bryn (reminder)":         "iNpuemq5f3nfFOfEHxLVAF4vGoUeSfCY7jxiCxdkG7o="
								"data: charlie (reminder)":      "khhYrSR8G51m2IuT9q7iJuARx6X5ZxTeZtettsGte6s="
								"schema: CUE (reminder)":        "cLocE50UZEwU+88D7MnS7aWcaQJb+9JYqgB/qRVy7O4="
								"policy: CUE (too restrictive)": "lTho1lhecxl2LBtCxzH9LoiHcqJSWTJYBG1iGtrEvj0="
								"policy: CUE (correct)":         "MublqtrW/n11o5O4DH/j8wg8bcDlceYjIGFTcL6YAJU="
								"schema.proto":                  "VJSWNyjEzGjdI+0vzfgYq03PKY/28cevE8wE47c7soQ="
								"schema.json":                   "KhzdZB/lCG4JB3zNxZH4RFPei3CTAYLho/hChvv6PFE="
								"policy.cue":                    "rtuXbYijYMHcYQITxeu36hssI/7PQQV2IOZcG20ZSOY="
								"data.yml (broken)":             "xg9b+MBswScCiIK/56OouSF5Qnc8vIs1pngi1fMH4Mk="
								"data.yml (fixed)":              "QikTXm5V71PJaU0VXhF49sGCrXup9H4Hw23gqS/wssI="
							}
							code: {
								constraints: "00GtBQe54ONObiAZUWS/eUVhkorNTy0anTQTj1aUs3s="
								definition:  "cC3G06whz2bEkHFvTwFBnZPHGBecXq1+1UKMQIC682w="
							}
							multi_step: {
								hash:       "7E7JA8MLFKPUTC944IPQJ8NNI8VPOJ000NVCPKEIPJU7B65TV3G0===="
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
