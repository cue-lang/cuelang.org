package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ZogscjS4XUB9RASbEixpfVOoWNt1VVjYqPtdII0FiXc="
								"data: bryn (broken)":           "LJMTKs+p9IGGFGfoH5aTjiVBvGBW7IyfDbaoaTJs2vc="
								"data: charlie":                 "UcwaUy9ZP/A/YdI24YseSmOeWbsr+zacKURmAX+7jKI="
								"schema: CUE":                   "TRm5VrYuEjGYgo4HhHfiOONvOEAeZ9aIu+MB+j0OrNE="
								"data: bryn (fixed)":            "ydXmZ29bQ+UW6I5VgS85g6QFjY05iHmdCSI9v8ms5m4="
								"data: alex (reminder)":         "Dxp5Katk33FVFeBwHKLVcFrRfyKbydaCMZYNCDv7SVc="
								"data: bryn (reminder)":         "DggK0BqlPngl9+mIvyDwk3Eoi1Op7etbVYWUjM+OwWY="
								"data: charlie (reminder)":      "nGTZ6y6Y9ONVukh4bdqS7CdrIAj6UZBGh8HadfmnOzc="
								"schema: CUE (reminder)":        "9BCZVFppuFzVwNPpR0BuIa6/A7fGz+OCsKhcAsPQ2D4="
								"policy: CUE (too restrictive)": "a1JOhvb7cIOdCK99wK007J1iBXqQ27IuWhljPTLWKT4="
								"policy: CUE (correct)":         "5nb8RDkCYRb3rapf6G3Y3Yok5JLiEpWgL3ONOJSKzjc="
								"schema.proto":                  "seC/vvSD6YicVA5C5X5aP4ZkNfdCUbzH3ES5FGv/hrQ="
								"schema.json":                   "BplmaDSKUejsP/vo11mKla6ZTJRZV/MkzzgArJmZPo0="
								"policy.cue":                    "uqukS5plA15khYoDtzK3zxgWq0WlV3gaBNnlPrQeZ4Y="
								"data.yml (broken)":             "YSN6+K3f6cVMcCPuKzDOeX7cYLCv3S7jzT/dAqxvDXc="
								"data.yml (fixed)":              "YzuoFBy31hJG4q4wjYeR+6UvHdj4jk6xOXEZKOhOMK4="
							}
							code: {
								constraints: "RS8sdovXlfQTyA0k3re4oNt1xHvxmkqJXsRvcuj1ffc="
								definition:  "Z8iqgp+3ylHZLB5vDHtNgagR3dRVHn9abqdpE72VkL4="
							}
							multi_step: {
								hash:       "KHR4CO91IT5A0V8GFQJSFP2KJ734TN9OPTDGC99OEKUCEHKGJHK0===="
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
