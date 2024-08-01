package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "2TaFuXHcwMi+IPm6E4ScDiivY7IuSDjap4xpaaQv8RQ="
								"data: bryn (broken)":           "PRCJOtGDpHnR/rplyq2gCQ77pYSWAO3WgSSaTcW15vc="
								"data: charlie":                 "a8iBvuhR7wl2xrsfhqBceK15RcwWHx5DG2JJAfVLv+8="
								"schema: CUE":                   "c1MPZfnwCFrChJ+liVpsmp/kTV4B1MiFO92rCSIqxFs="
								"data: bryn (fixed)":            "LBxfldW90LHMoxrL/q3q214MREUSOXxFYhtwemM5ayo="
								"data: alex (reminder)":         "cZFnLlidExHskFaD4lf+zEnGL1K/l2LOLDgp988AOJM="
								"data: bryn (reminder)":         "UtDdumhcQWv/OdsHoZ2LsaqSnzF3gbf7Dyad9mdVXN0="
								"data: charlie (reminder)":      "H9Tw5OYX8Z05lkbI9VGVgWbjHyjPol4ZDUBUT6nhYXw="
								"schema: CUE (reminder)":        "xuQ6VvCT8lj+8BVIxtMuf3p4+iRQ+oEuNM2F+dLs9J8="
								"policy: CUE (too restrictive)": "mpZhqBgp0J/n4iDiZ16HL7lhE/sZhhvBvnm86oQ/HkM="
								"policy: CUE (correct)":         "oYakBGfEu+p4rYQiJ+XN9i9baoWYacy3u5MZuvatgV8="
								"schema.proto":                  "gpb9bkMxOyggp+OTjyHDcGPhoQKPhOGAoXTaCOjXY/A="
								"schema.json":                   "dDaCEvZ6PwHJKsMJ71C1Ibhkygbse+FJiUX+tp3CBLM="
								"policy.cue":                    "fyE8Zo5YlBfUUvBqQBjuIa12siuBsPUWbB0KgL7neeY="
								"data.yml (broken)":             "EkZu+UxWiX78Om9l5QZ2UHen0Qpz2Z/d6uNRIfkNRtQ="
								"data.yml (fixed)":              "1CjbyKgZox4tvV8rDWMFKqtcb9CBISKjal/2aBj5JPE="
							}
							code: {
								constraints: "udoK86dEJeAFupX6xHiycU1Alo/UyU/navo6cZ/GhXM="
								definition:  "D/o39kb9Ej8v+wEuKXLMKWW/pWu83B8+OWstDh7W0UI="
							}
							multi_step: {
								hash:       "TI8S6RCCM7Q2EUP98FI3QI3RDO2S0NCU1CQ6R8BR47938D5SQA7G===="
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
