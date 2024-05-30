package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "/jyL/WGOCNnQ7HzAh7vtR7sK0qwMWTqRPkY9n2SdSHU="
								"data: bryn (broken)":           "GjSAvSAuA54lBsh/svc4nbWPTbRAYQnHqvr1CUKp75c="
								"data: charlie":                 "2ONCp8bRmIlxhQqasehBR6E7zySW8KEbzd9ijJHUU9c="
								"schema: CUE":                   "MnHP7sOuHu7gqm5Gpyvulp1fAzD0tLJV9pIUf/xzJjE="
								"data: bryn (fixed)":            "L/FCAMy7lGXXQsGFZzM4JHFVUKDmNVsMW/W3X18kquk="
								"data: alex (reminder)":         "0L5wsG92OPkvr0yp+Nw4ZHKijhGvlFWlhFCOvceb68E="
								"data: bryn (reminder)":         "5fGfhHZDifjFpag9b7WGOpyKUuYIErzrIyG2Wlexbso="
								"data: charlie (reminder)":      "m/jzCRzBj9WoMDHgfTFJvI0pdFk6lvUjvpmwRzn+d3c="
								"schema: CUE (reminder)":        "58gbXMbATdIeLCVWZfAFgR0UpX3pHsWnELL4+8jrRNs="
								"policy: CUE (too restrictive)": "fbh6L+F1YbW8U3lkV5kKUfQLleDtFCgNafq/hel0GqA="
								"policy: CUE (correct)":         "e5ITDlaR/8WeEgN4nQo4WtO5OtTzYLeIJHnYjSSSDhM="
								"schema.proto":                  "1gXYvMvoZURjD5TtA7anjtcAoGqqxPYZmtmx9yzkSiM="
								"schema.json":                   "hj6Xs6NUkuHhwbYVO3R4Q00L4xSYp8Mj8NC1vYkdQj0="
								"policy.cue":                    "lGy747k1bzEtgyFw1c2RAy2JQiaD3213dArrBM3rPSk="
								"data.yml (broken)":             "6ChTzKqwBDWirTs4SoDpHJtNSxmnsplU12nFn0slnIo="
								"data.yml (fixed)":              "i3c5yM8NnoBOaZwwo6n5jIasrSwzHv3LVXCzshrMidA="
							}
							code: {
								constraints: "m6vwe26tbBDbo4Bo08YOTpN+g8zPhD8XnmuwzZTGMAk="
								definition:  "wfhDKSi6CIHKXoG1bzVUoU+GJr6BVi+YIIRyA2Lb+Gs="
							}
							multi_step: {
								hash:       "P06B30I0JAS4SOPJF0H8KCTA8Q6US9BJPIB82VVCO9EG6F0F4TO0===="
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
