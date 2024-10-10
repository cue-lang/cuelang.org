package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "g9L6+rlEmpZO2yXZWm5BPX4LMsnn6jkGF4YME3LHlCA="
								"data: bryn (broken)":           "MtsU6STHDs81Z01YLJQhwRF6quJ++jkAN3C9ATZfAvA="
								"data: charlie":                 "P8XvVP4zE+y9HJIQCLjRmhuVH4+2oxtKaP6ypyYQ6vo="
								"schema: CUE":                   "LwjRcheVA7XrofeePXCfFJIkZgYz0/QjZ0RfIGxZ3UA="
								"data: bryn (fixed)":            "Wqv++WeXcxari5ovl+kpNVab3lVsKh1lsUv1jfCUyUc="
								"data: alex (reminder)":         "9K1v4fFdHZT6O6fX1qP/xG5sOBAw5mtzknj+3apmUZM="
								"data: bryn (reminder)":         "oTXkhorX5anDBT1fK20LbjrO5oVvUpo6umcBoD0l+qg="
								"data: charlie (reminder)":      "K5n4i4By1mpk3oE4q6fO9/aOjuWnqT3gMPa0encST94="
								"schema: CUE (reminder)":        "pZynMmy83g89ofSjLJZ45nV/qsWgrzwBpktJuwNeHso="
								"policy: CUE (too restrictive)": "qJ7oS6SwjUb8wIQWWHccOQDYakT2LJOypHOPV++lSNE="
								"policy: CUE (correct)":         "l5/dYgzDqCxRqLbM3M8JaSy3mZRYdI+dybS/dz7evcM="
								"schema.proto":                  "UQANYPYnBoCnB9wJt+C23FmzzDiIKhlHL12DFfm0J5A="
								"schema.json":                   "3vImquil7GUZ1IZSKvZHx8DVSqYF9E85jInoOz7axaI="
								"policy.cue":                    "B7m++jNMM1SZZ8WYQpvyBjJ1P2IZ4FQ6Dw1cwMBngxA="
								"data.yml (broken)":             "CppyL6CqdgSUNf0s2bkR+43CA1nQ4ndKiaW3YagsPpY="
								"data.yml (fixed)":              "S2Z2JiN6QUttynICLD7mOBwQnzh+yobTZ1jY7OP+0gg="
							}
							code: {
								constraints: "106Z9/kbpX5R1wAFBekkcMuF1kYUGY+txJ8v2Nd1bYo="
								definition:  "ljE0D7YGJU8ns755H8+bdbiOn/QkFBhoLx97oIIn88A="
							}
							multi_step: {
								hash:       "GBPD9KEMTBVLQIGJM50S5KG0JF0N58ED2SCPLME5G5CLV8KMJHJG===="
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
