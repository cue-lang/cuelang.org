package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "t1UzAqB+GgtKhALMNLiyhv28SXEN02cE2Z/93H4Nc+g="
								"data: bryn (broken)":           "Rlq4IR3N2OQiRRAGeawcmnH8Fv04hLkW2R7xKpO0TEY="
								"data: charlie":                 "Q0W5gg5dnS9H57ZAoJYGufDZCv3k0X4v12PwmNMnM50="
								"schema: CUE":                   "oI+YwJKadIVt9L8KUDHOzgEmaERxofm1akevDI/4J0c="
								"data: bryn (fixed)":            "1Qa6b1c4Mf2egukl8niElOgJblMJRigD0NS6p7ZNbCo="
								"data: alex (reminder)":         "TYyAvbxrcKHEDiGQuJKrGpXdMpc5AEuC0pm0tzEbq/o="
								"data: bryn (reminder)":         "1pz3b3I+YhCuWN5wwdhPqWT6p8Ob0CfvuXyMxNp2nnI="
								"data: charlie (reminder)":      "27LxloEAL+JbRYp2ua511Fa4rje7HkdVoCGtOlUS2no="
								"schema: CUE (reminder)":        "tLmQsRpUM+sOjF+m6vgneI7fa6URYpFwIQLMj6pN6oo="
								"policy: CUE (too restrictive)": "r0ILWihPVc380vI1yhMYKO5mCsVK0eD8yTDSvJGPfDw="
								"policy: CUE (correct)":         "be8oIp1a/ZIhHGPgAr8S0pSCFG/lokJGx6mo0UQ7ip0="
								"schema.proto":                  "uU2AsTu6OLHkG/vMBxHmnUBxddng+9XVdSzr5JyesK8="
								"schema.json":                   "PzeN8Kj1Nt5KwKm+lAi750ho+pMm4vr38nbhnBuIPrc="
								"policy.cue":                    "fTt6zxOoKEATfNT3sPDLt4cwW9fmVA0TT1cRtSDchSQ="
								"data.yml (broken)":             "/eLEqaNvSfTI8ehcLY7Vk/GmPH6G+LarfQ/trg7C0bA="
								"data.yml (fixed)":              "W3ZKeSl9WEREOUBans3RYl4TqD/SYbbVlcE3W0DzDn4="
							}
							code: {
								constraints: "RWxd7kzjjkkxsBU1sIYIMQSELR/HqGx+FHCqNhHqaYU="
								definition:  "ptAYwTBcEeRX4AgHi7E1oi47HQZx5lSNDYsU/nHoHTs="
							}
							multi_step: {
								hash:       "PP71KCGOEKENRCUGMAURUGGCH1IJOIRI1DFGQ5EONHS1A97QBC6G===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
