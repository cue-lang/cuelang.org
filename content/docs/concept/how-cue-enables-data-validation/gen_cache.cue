package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Yjf6n3Tu83SyuOpokNdyzHUrIx+CB3QBeTlycZc4ALk="
								"data: bryn (broken)":           "dDrU6gcsoHR4a2CbvljWkc8Zw3+7lDNMNQmPj9Ybh7Q="
								"data: charlie":                 "i6C1rdZ+exJQCV1VqXvEJt/AqZLbtulTPRQZW+r2Lr8="
								"schema: CUE":                   "d3p7zqEIpfHawXblZXOMPxqMszhNf56MHdi78DEhDqQ="
								"data: bryn (fixed)":            "On4yr2pVpq3f7n7OC6fxtNIg6DPBnmF0ZzcnFBgXLBc="
								"data: alex (reminder)":         "B4B1tRhFmkSQiVJ6FEzla4MGRskUZsGkuGWAbNYyPOs="
								"data: bryn (reminder)":         "EjGA/f3PHxR2OdUPqZtU7ug8OQTHiy/WlH2GfwF4C2g="
								"data: charlie (reminder)":      "s3hwuGaB7s3dCe5ztmqRWIBUedWzKB131qhyd8ynhHc="
								"schema: CUE (reminder)":        "RHEJZlYSo0vr9ernGHKhJMUY156AbaQ3SXInfXLrriw="
								"policy: CUE (too restrictive)": "+hnbGll9l4HYRzvPz8lZS0+Y6+FUAcOahmSs+NrhyQw="
								"policy: CUE (correct)":         "tB4eIAmv4eHHYmaegHZbnWyaPEOfqRn4xLesOx7fz2s="
								"schema.proto":                  "O5GecBvmsiS71ogBwKXBiA5hKNftS7JbTF/p9UV4i3w="
								"schema.json":                   "iwA5Kq2MrDl9TVi1SMDayRfZgtZ+f1QRt9v8yJq9IFU="
								"policy.cue":                    "CxM6CXv+8w055xEXTKYXoHYmeVO+9q2by5U88uWKb70="
								"data.yml (broken)":             "qkKlnpf3/0Cfk2RXyK43rn9Yca0psXUm1LPvLF1qAic="
								"data.yml (fixed)":              "RqDbiK2oB0eMa6S1oAT63rDsXvrKlJJI0bnJ9vZDCYM="
							}
							code: {
								constraints: "kDDlchigcQM41a2VKuRI1cf+CQONBEIqqMSAqg9Ao5I="
								definition:  "6O0/HSwXlPAQZw/tK12Wbj2w9FPBXq0aRQXHw7B+nL4="
							}
							multi_step: {
								hash:       "IBL1C7HAK7TP0QEL70UST2V1GOT4DIBC86E16UNMIHTU0NM7TBS0===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
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
