package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "DOIaV9qrj8bSW1et2BoqlGCwGxr9aXNMjT01s+yGpzs="
								"data: bryn (broken)":           "2nWGh/eq8VQGlbXRAEOWmcQ+fdL7EIYVbuI9cOyeI84="
								"data: charlie":                 "ha1oHXzo3gXy2i4p/9gFfj3I6KE2onVafsG3Ge7aH78="
								"schema: CUE":                   "vV3wHak5gIR57zJ3KDPMpOEQOak+qgEhhxhx8ZAul/s="
								"data: bryn (fixed)":            "wS8Q38GcoEb520u2YwWPGSd6u7aiuRXNpPENOGmo0eM="
								"data: alex (reminder)":         "NUC2DwDKxVNCZIkEc5pU5MH1yLsiXYKDZ22sqU/sIjk="
								"data: bryn (reminder)":         "h7sM0f3WpgBfjzm56Ox2q9LFp3Q7vkoeFF/PLIo5QXQ="
								"data: charlie (reminder)":      "HYomgXcESLgJGIahFtklcJeDvXRqmz4yaXUqOw4gXvI="
								"schema: CUE (reminder)":        "aE+1VTR6mR52VaeVqd6wGrGUbiRqxyc+n61f9LGQ4aE="
								"policy: CUE (too restrictive)": "QvHYDpIcfM1Nq0lhPwBIHwCJy1ebpnZezKfX+dod3+k="
								"policy: CUE (correct)":         "9GluqHn8ry9oHTNqYLv5BZxHsFioQaV0mbWEx7jLVr8="
								"schema.proto":                  "qjJii4tkry6xaxdIzLT7oMm9XVd3xSBE8GUCDvYgGJk="
								"schema.json":                   "Vkdwt+ql0PmCN4xSxOhpN2z5aYOb5jkwAqpQKp9CpW4="
								"policy.cue":                    "pFrEEX5ambMdE2eVDYx5buvKwd/YtAQ/VG/m/32qJe4="
								"data.yml (broken)":             "YBWJwQJD01QjZIAVo5deVTRZjlDEUJS/5RqnS7nTMk4="
								"data.yml (fixed)":              "avLi3BFnv5749HqP7chucO/ucK5Sh2J/xqZZeeUr64c="
							}
							code: {
								constraints: "g7s6W1bsNioMS/5NhnDfCPCAnmqBVcbbpSydIu7YY6Y="
								definition:  "mzeG1tPptwy+3HXziAFa+J9cCTFJ2rvBzDCoBkQ85uU="
							}
							multi_step: {
								hash:       "M703QRMQHCHDMEP9981ICQKM780KUD45AFC347V76OUA4H0D2O6G===="
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
