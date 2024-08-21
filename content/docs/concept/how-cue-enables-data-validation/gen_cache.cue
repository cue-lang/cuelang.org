package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "BIW67GDwM9IJEUUBwkwFucokBWSX9zJ8gGVNcUbED/4="
								"data: bryn (broken)":           "wqOyx01QyC2Stt6ZrCYobFwCfXD5b9R0mVn4E27HGGc="
								"data: charlie":                 "vuASvYIdkA6SKoeGO/Sy3CUNW20oudKH1Qc0WowwxvQ="
								"schema: CUE":                   "+IfI0o3pvyaRDl+PDePjENrqCL9zUQL8Csk8AnwOua4="
								"data: bryn (fixed)":            "lM3NNxFKli+g3Qb6jAV0uNjPB6RyD5ssbULJmrrLvuQ="
								"data: alex (reminder)":         "7VPgZGbN0a0k8s10mqx2OZ226/pIXuklfPQ+V9yk67o="
								"data: bryn (reminder)":         "paCpF8l+Y5An3KtZtyu0X9KBYn4KlILoL/haoU+j5+k="
								"data: charlie (reminder)":      "MqVppukioPap8NNgkNrChv2ce8Y1C6OACgmt92cSHnc="
								"schema: CUE (reminder)":        "BOdQ08XwiLoFyFM8nCZIQkOoDLk3Jo4fnjcyF7IRWXg="
								"policy: CUE (too restrictive)": "NOXNKOT3tJs7fosLcR87k7KiRQydMRIosF4Yh/FIt+M="
								"policy: CUE (correct)":         "xY1MdO0EmrWtMKgHwQmgHQCl6AN4d0xkvJt+JeVEWCg="
								"schema.proto":                  "jXPb3KW4GRNy6XEVLKdfPsn5GHLVwzF1yDyyCbd+TfA="
								"schema.json":                   "9uRjA//NxZXor5Vp8H7ZkT0PlsvwGJdTK9UTWwkuwUQ="
								"policy.cue":                    "u7ZvFA/fMIv60VPQh7iBdBTMP7rKG9eD67l/9+UEdCc="
								"data.yml (broken)":             "Z6Fdzx89PbEYANgi1EYIGZG71FX3JEa8c4TQJ6nDnHQ="
								"data.yml (fixed)":              "j1mdSr6lHHqGvUsCTRhlTg8La0CkYy8qLZmjI7+3Quc="
							}
							code: {
								constraints: "kDrBYB1Xvt2ApGARwWIe+mNTv0K4lvWKStzBvbNeCPU="
								definition:  "YLR0dAflf3YKlSo/KIHXfnvUb3PKh1roU/9YnrkYJT8="
							}
							multi_step: {
								hash:       "05D3STQFC13P8NI5ANT9RRQIAJJPVHSQ8D10KIDRLQJPQ3S0ABVG===="
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
