package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "V9fi8nHC8WSmCSxnn0CL539yXObEakaOHVGPvTeQd4I="
								"data: bryn (broken)":           "kkgZc7G84+dxt/GENwshjNz+uMR8DshxipN+33vFoms="
								"data: charlie":                 "0/3jJSXhM05ulzLEqO1IBLwQ4ev2C70N9EIJLVdryZo="
								"schema: CUE":                   "BiEVpI46WgnvhxdGlq/tOTxPDqjTPxEhxtKHOVt62cc="
								"data: bryn (fixed)":            "7Raqomn5fAiQUi/R31q2OvpAVucOO7rVnC40YBcPxjc="
								"data: alex (reminder)":         "0UWKL+21WRC81ov485Af9yhcvyOQIGHshqAYj/F6ubY="
								"data: bryn (reminder)":         "yM42OgKogEfU/qcIHe201NwLeIePaZ8URwlnlmAyj+o="
								"data: charlie (reminder)":      "maHYLeQ7ngmSmtwlusfqUsMSc2DpMwzE2VbTyyhkUgk="
								"schema: CUE (reminder)":        "MafwV3KkFbFzfwC1NN4LZwHVkP2ppB5/t+yx+LxduNw="
								"policy: CUE (too restrictive)": "45TTCP3GBxuFctu5/YHvOF3od6qLQmEjQ8gbivCVx48="
								"policy: CUE (correct)":         "XvHdshkcncR3eJKA1OT7zrG+CeYLeHhxDr0UPlc8zl4="
								"schema.proto":                  "9B4BzTdOWm4WOoMmq1rbMK7XymGOnnxRn62Z1ra6HdE="
								"schema.json":                   "mwtKZ8IhDZligSiauvCjWYwc2L1Zd351Xkj+y2HWAHw="
								"policy.cue":                    "ita7M+gnni9Uwr4EVypbvTbkfcn6zbJNd5D6IYGhIvA="
								"data.yml (broken)":             "OVlVY0FSVW/r1hJYttFb8K2+rUVV6MD+ywrzod2lHMc="
								"data.yml (fixed)":              "0m+MvXvJ1fuKppiDFP4BC8eZ8cY8ZMU2YhrBmv8aMzI="
							}
							code: {
								constraints: "PKcJb5csuQHJp7dN8xVNof6ybxOsgqXuiIWpUP31phg="
								definition:  "1gmDvmY3O3xHIcHsmE624AUHjFDWZKvfzJkGjnCWuGc="
							}
							multi_step: {
								hash:       "C37I7DH524C6S39G9DIQ46QB8BL3237MMKJMRVL2D0BVNH3F38OG===="
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
