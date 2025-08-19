package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "619lEhwMRaNWKqFMxGFfxtAN6illDqISzb+k4mYFqhE="
								"data: bryn (broken)":           "qQu+vAwihjzv7/P+nZ7ve+F88eIg1KzzDGU44mtav/U="
								"data: charlie":                 "SspsZxGGtQOtz6a7ttp6xWXzevIrBXRbMDtouCUiVpM="
								"schema: CUE":                   "LhKoVmb8sdFhFa0452E6lcvaPt4zzj+tnqr2D94JeEw="
								"data: bryn (fixed)":            "9uwNyxRfkEuEM7afYuM/ey4qW8edFPuTD6lM4GZzJDI="
								"data: alex (reminder)":         "WT+MuZcd38aaVuvq36IXrA1f1vegU4eRmjZzQNX9d3c="
								"data: bryn (reminder)":         "tvCsJci7a/yhbeUdsIl8AcnzDsGShgX3SBmWRRebKq4="
								"data: charlie (reminder)":      "3TpKIM9OiAVxiDdQDOErAjyehGMSY+ykjPyHAeEvA4g="
								"schema: CUE (reminder)":        "7YN4gFZq59viUcD4hBLb3v8bphVTUeV885K99+SVrXk="
								"policy: CUE (too restrictive)": "fQOxGLacceeCjVEDKhtDfGoDXlGmpoyg4UZvmO+yrOk="
								"policy: CUE (correct)":         "bXYe1wT+oI6/Lm185nGeCN/4mrFQIJEOR+7+KJ7V538="
								"schema.proto":                  "zgaZ0NpR8TtlXSBeQaGNgj3kEJhL4MXRV6kyQLMj1K8="
								"schema.json":                   "Q582dJJgdJJ2HUVTV9B40LZqwNMLebrnXDRYiRHIuvM="
								"policy.cue":                    "q2qtbgQquo77d9aCrpz9hd7iRRAM0GcsXetAbhyCm+w="
								"data.yml (broken)":             "wHMo002IvoLNN+aIwaxeFkvgeuTfUIEoFCGweJW+8Kw="
								"data.yml (fixed)":              "+099bGlhGWRh4vHJDxGTnW2M1wvn8Y0eQiTNI2jkHu4="
							}
							code: {
								constraints: "c8Mr26AXCOYU3wcAsgez8tO6nOBlAXTSjUwwzSoWra4="
								definition:  "WJa7S/cCZ+6jkYLp0RCXmHl4klcPfkA3HqlYl0Zx/9Y="
							}
							multi_step: {
								hash:       "VAGBTEFNGR0U557AE1AQHUNSBKJ44SFGOTOG4IBN7Q8TQ9FPM6K0===="
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
