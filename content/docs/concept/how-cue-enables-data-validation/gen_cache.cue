package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "VXOKLSdcX5ZUwvLxAu1lnPm0/qM5g9gDR2lUoOkkh5I="
								"data: bryn (broken)":           "a9Z3BiUoL3OzGkzTBFGGhOJG2eIBUsvz4Miz9So9CBo="
								"data: charlie":                 "1157U6o2FY/P8uJdHYWLa9if7yY1dJJvo9frsc/tZBc="
								"schema: CUE":                   "9YvWCVizjzRItfNTcySF0j8kWGZrkUegXNXIgzP0X8M="
								"data: bryn (fixed)":            "maRyP8bqzktleI93QtUQHprkjtfdleG4PT/OU1QoVc8="
								"data: alex (reminder)":         "bNNAHA2etgrxr5C8Zx0oax84GXEFHhZ01wBd1O+YD9c="
								"data: bryn (reminder)":         "3ngNEqK4GjDxAdrUVxdbWTvTSeGwPdfAXnlcWGTWHBM="
								"data: charlie (reminder)":      "mZJz7gfBayRPM/mhg1QpOdfig/vUn5QPMSOYenDs2HE="
								"schema: CUE (reminder)":        "F54IjByYSuQP4CL+95SmphFzYvIQ3Dpc6mwLtYOIk04="
								"policy: CUE (too restrictive)": "UbAG29odDRrw5NhUCS2tMK6dIrAcDYDcRVWsvO0xCzM="
								"policy: CUE (correct)":         "ZqREWx2Jv6thbts2WGrM0zUwhwNqiD7RbcA358RHOrQ="
								"schema.proto":                  "yA0EjV+naA2atHt2D/9Z6CEy4EoWYelYxTl6lw2cFKo="
								"schema.json":                   "3xPyHEbvFY6QSx5x3R2ZXCDjYRuaEUYOkc/w2U/qIKA="
								"policy.cue":                    "8bPX8WTk3PKqDtnDoyQlM6vKKmSZns3/6IIfhsTdHFU="
								"data.yml (broken)":             "kg4Ux+psT16VSWQRQf6vc8c7dKX08Gws7Z2iLFht+ts="
								"data.yml (fixed)":              "7LO3DniTaW03nfKjVUBF0PLD7yPX9m33KJU3RnUaRq4="
							}
							code: {
								constraints: "2UhHdhxEJJHt98blasWJJpt2uebCziKwMFIou2VieLw="
								definition:  "FKauxE5Fz14ajE81tKwW2gYb33nc4kgQEmyn+VuuXcA="
							}
							multi_step: {
								hash:       "01VJJP46EHU4SJPIGCULRP3D46TLFAQOIUHQ0NVPG7NHR233NV20===="
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
