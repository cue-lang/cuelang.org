package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ZvWQ7fkihVgW1gpBa8svkO3l8xMW57fdpJf4723PmMg="
								"data: bryn (broken)":           "rjRPF3eFt//33R2DMI3KxDhpe7M1YN6C/vKfPLFQNjA="
								"data: charlie":                 "COF3dFH30+EnPo7eIh4y85CpQQE0JCgJRpfA43dBdlQ="
								"schema: CUE":                   "7dXzttQCva0r12uVoWZZIJh1HZ3JwQUqwti0b0JlgFU="
								"data: bryn (fixed)":            "4AdYoNqxzPYF/28XaZakS8PVCTCXA5JXSwD6xUEi8m0="
								"data: alex (reminder)":         "Nha05ZelB124H0OSwW160xY+J2QLAzVSycj81Ceputk="
								"data: bryn (reminder)":         "YQ6Wr7bXLsKiARD3tDzZaXRBwIKa4EDSBc//y2IamH0="
								"data: charlie (reminder)":      "K7NSQyeejqhBnCA0kQIUKAd8mj0xWimlnJXIPQAOCrQ="
								"schema: CUE (reminder)":        "N/l/a+whZ1DwpTzGAfkflHjL2nLE5lniEgjHrrr2fCY="
								"policy: CUE (too restrictive)": "9N8C2/u+Hgto1KKmjIFM0qztYFF2+0guov34+i9yZUY="
								"policy: CUE (correct)":         "5DxQI7vPo+WU27kpIY8U1CgYUnpfm9F0vwJggjnATZ0="
								"schema.proto":                  "lJre/+xq/meCV6K8sFBq+fOR3O8CfUkHL+FQ0+V+eSs="
								"schema.json":                   "KZOyQI2sPlhB+wbPXBFX23fOC9Z27EUOqCSN2AcomSY="
								"policy.cue":                    "bXOT46bGdzVLxMiTmk7RSM792Qglgcy3zyckaMhvQI0="
								"data.yml (broken)":             "KC19LFUjpGtB4g29sCZ9qJaJ2pWrV66Q+FGA2XeAwWE="
								"data.yml (fixed)":              "n4wP8dBxEVsgu8/lkD3hNhHHgU+7lPKvEzuml7rsTN0="
							}
							code: {
								constraints: "CYlbwLqJpklHnLx6vewWhhCh6tE0j2ToGqm0wZztp/c="
								definition:  "Tq+niO2xhJRh9Jh2KQkWjH8QmvlTjISSg8kdVu6na/w="
							}
							multi_step: {
								hash:       "TCSLLFUDBRNS46DQEG0NJ4T9G91PLB5L61ERJ6CLEC3Q6ECFNAVG===="
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
