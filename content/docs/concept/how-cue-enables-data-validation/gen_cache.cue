package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "3Um+NlDI44TwGy/XJojuCDm9AbsT/F2o82Cpxm9hDTM="
								"data: bryn (broken)":           "soOZqqwpq/Uc8YB4kjO8BmTkWQmzC9einVpUJ0u3Q0E="
								"data: charlie":                 "Q1xUkWyxK2xahT8umufzP8xAXnu9yXvadynu54rx0W8="
								"schema: CUE":                   "Y/Rm8QNvV5QT0/4ttXptS0vKGC56eWuemD6lSS+R+dY="
								"data: bryn (fixed)":            "0pi+Ph9bEGOujhi43RnwtdgrgWc0+BgNSya8brc3gX4="
								"data: alex (reminder)":         "6x/mgMXnX/f+Hym66xQibA5t5eyRBOrLdwI+OUCR6oQ="
								"data: bryn (reminder)":         "YxC8H3q40WEVlWTNm7ba+Nij/ysb5Jg6+AFSi30JNkM="
								"data: charlie (reminder)":      "JdUaWgAGwA+okjmhUzn/XmHYGasXb0CvVFLF2hKw1N4="
								"schema: CUE (reminder)":        "BeJGScMKJFf2D0f9KDI57SCbI4neF85fPIIdrKwYr30="
								"policy: CUE (too restrictive)": "hFQJfdK+ok8+qZDcOErv5UEQKIssc6T3UaZfr4dp5XI="
								"policy: CUE (correct)":         "EUpYjv4xDPOSrQC2B/Y5FKYpOQGVUbfetN/7cMUloOU="
								"schema.proto":                  "LwDUfZjIoiCr7pxNGVkpv71sj13IHWnUyUSolSZWeiY="
								"schema.json":                   "l+vVVUZD9EzCb7VBIHOZIIEnkTSo7yVA6dRVFbcA3f8="
								"policy.cue":                    "+p1TjjJNXm7bwDJYNt4I9hb5LCWPRXXqCoqUV6iqPpc="
								"data.yml (broken)":             "eSnJUV0p291mKZ7NPYN/3/XYXdhzpAyty5fIdPmpt/k="
								"data.yml (fixed)":              "qX9R0rMwY/1d1sI94XuVgxEKSbcADmpC1ijRHygkNUo="
							}
							code: {
								constraints: "8tkYFUIuiIaBSvQtKtZcVzY1TOlu2chSy/BlVVn/piA="
								definition:  "s6M0Kzp6vANyaNFOZjpAjIgKJ2r4bC9ZCTOBQpvgV8A="
							}
							multi_step: {
								hash:       "EGSJAL1HLNO3KDQ11UVOETVCGN4EIGUQPC9QBUF6G6ND7KUCEIS0===="
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
