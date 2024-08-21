package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "K301Up8rrN6IpA/LrQZhjexfHV5SQQUmVn9s7FAp9aw="
								"data: bryn (broken)":           "WjkZWYHf/OfEGUXGjnM/DWd503WuWMGm8LCBKOFHz+E="
								"data: charlie":                 "swGYHIdPnvVat4itPVeAKzexBz3riqxpp3jcugbJ3aE="
								"schema: CUE":                   "x7wO2kbxIdRDkBjWbJvc82HbaeZvGaJGB5l5OOtnSXY="
								"data: bryn (fixed)":            "jUkBZW01G64DnITMbjGjIQzszQp+8z2MOKGzblm6CL4="
								"data: alex (reminder)":         "YEY5Ek1oMXWM3TDWFX03NyJeZIc9wDvJ+L38IFqkieU="
								"data: bryn (reminder)":         "CqgMkYobHg8ootyfQOb032E/c7KYUff+A3q/D5Lv8sA="
								"data: charlie (reminder)":      "RsSXw3HsKcvjvAN0Y/uWLzcux/2LvnKuDifr3OQ95kU="
								"schema: CUE (reminder)":        "nkJWWplpaSOQNSUIxRoJdPhDBT73DhHdm7t8UtnMRPA="
								"policy: CUE (too restrictive)": "GhiBxT6xQIgXzY9vqf9rWjmSfttBSWR1EUbql2Djr9Y="
								"policy: CUE (correct)":         "sOaQQvzm8edl6WSRYfUde1zHNnEvVXNfs93F/KwIrtQ="
								"schema.proto":                  "yOJF20t9Y2epqbVvW9Hzv/KmazbHGdelr6xTLKUd954="
								"schema.json":                   "jqkDB/fynS8sgPvyEWnCh9vxYxvJ9KTP82Z0kPefdkk="
								"policy.cue":                    "QwHNb7PTbXC/JEmSLNy5iyqEzJ/DQvhmwPYDlJO9ZC0="
								"data.yml (broken)":             "mhq+eGw/0GuLnDgBhS1snWhqj9AIXmJq/rRsb1ejk0A="
								"data.yml (fixed)":              "Oi/umVkZN6/YE1ueEZLx31LlPbCbM5AVQiGYjH5GB5o="
							}
							code: {
								constraints: "HKWIjnbWT7qJGvyofZw0bbI/lD+hGmgZnMnvJoiAEio="
								definition:  "MC29D8C46ZYYG54o6S3BvdtljeXljiMY7CLSLSX4X1c="
							}
							multi_step: {
								hash:       "N1BDD35BIOUNTOOL6P7I3OMDJ1KHGR21JB5D4V1HP17MFJVT82S0===="
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
