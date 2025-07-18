package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "aHNlphB+4lOYDt1YRUGX1V4VNHs5aCv8wkinVQWpPhk="
								"data: bryn (broken)":           "vXt9sxJVIlqla5Oyj6ttw8T7m0iv7UsnJ7PhQNmSYuw="
								"data: charlie":                 "1Cut6J/q97wxc/lAohKB8YiPLQ8M4cMVySzC8ksbPCk="
								"schema: CUE":                   "s9ACVaTJnj/UcDKEti8kHGFUdnxeI/HHdHX4iBOPeu8="
								"data: bryn (fixed)":            "Le3Xk1IvOEvRhDplK9Jy4T+/D3SJmKL+U1svyBnVtRc="
								"data: alex (reminder)":         "mqOIT262Ke7PqLooh9kdBOJYEpau7jzkv/Gx3P6VY0U="
								"data: bryn (reminder)":         "AGowlk1STTb+ZFOUC+qNHViuWecqf/pz3uX6zzJV3dg="
								"data: charlie (reminder)":      "W09LCy4YrSk/qiryEPGaPH/oTkpsBrXCIz8lJeS5k6Q="
								"schema: CUE (reminder)":        "IHNbKsKPcqRe4r+7auTahPygfSKkWyex5xuNLjDYk0I="
								"policy: CUE (too restrictive)": "DrMn9tIvyXyunYxSVC4kUjA1L2t6/Y7tC2+i4tK9QtY="
								"policy: CUE (correct)":         "7kPS56N/RbSZom2/RD6lwI/EyjHgbLJ3vs9nooMWJ7c="
								"schema.proto":                  "j6daJJIUAzHx1xSKUMmOdM9EM1PLrY4m21GlUi/thCU="
								"schema.json":                   "rJ0xoy87HaXoCsuidKSLI0LkQwl+3429P53SWOtw9e8="
								"policy.cue":                    "uNoxMf8T8wBbWq8+k8bgb26v34Pvwp1RQwu8zqGvKO4="
								"data.yml (broken)":             "6iU7idwlUHtka1jj4FXn0i2p9HzRPYorGe9kxLmE9jY="
								"data.yml (fixed)":              "xzVLMZMrUFUR9tAN3uG1Wyea8YTI3MnsnD2o8UIXsC0="
							}
							code: {
								constraints: "Wy3qVaMy4xntSiJZ3edjJdcNO6EV9YBytrS475Gk3Vo="
								definition:  "TWFQ4oXvQCqpKi3G3oNpOu7fNiqbh/DleVDDSsa4zNA="
							}
							multi_step: {
								hash:       "6O3SHE1VLJVBG9HQ06OISK48620J9MVTORVJB1HS98PJSVG62FQG===="
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
