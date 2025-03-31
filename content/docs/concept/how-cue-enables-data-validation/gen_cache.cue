package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "KLB5H4arWFtW6Ev6C7sdPB/JsBCaRHE1jKL04UFrmN8="
								"data: bryn (broken)":           "MaE9fOzeZlXTdvzE8oU8QI35a5HD+cBvVIkS4eJ0Jyc="
								"data: charlie":                 "upoHpBd/uQyha2K+2t9OSfv0MrxNi7ZXEhgPTMdcWIE="
								"schema: CUE":                   "nVDM4M7Pa+r9dskOgf/YCPrDSMvw+0iOWLnJsVu1ik0="
								"data: bryn (fixed)":            "TEwDz3WVmFnJ1Xa5/Cio95V38NhcNOKFr+Ql4/lUtJY="
								"data: alex (reminder)":         "YkO2L2M67SUcMWQ2bU3iIlHOHnABQIUgjb5IwC5SNVk="
								"data: bryn (reminder)":         "8CidiIdOAqmJ7GTF4lE3DPCUh+ca/QIElL29VBD8H9Y="
								"data: charlie (reminder)":      "JxgcOHhha0RKv3K1QXqLcm7FrJlM+myF6Cik1xT4ZFw="
								"schema: CUE (reminder)":        "djWgERxTHq/jpi8hCFQ1HvF+BmiJb/GC2D2e75Ij2G8="
								"policy: CUE (too restrictive)": "UIUu3K+AWoW2IvRfF/5ouX/5uYXJBQm9ND3F98GY8K0="
								"policy: CUE (correct)":         "dnuLqPjXVsGMcyvCWX/pXO/ZprR/ADCTo4HfLK1MPGM="
								"schema.proto":                  "YhaXiiGDXlF5mNfOTYXLttvLC+LLD7Y9Z+WhQu7hRVI="
								"schema.json":                   "0Lbdi60hn7DevRO5R97iKEtK15uTjb71nHbzwwbQpP0="
								"policy.cue":                    "mLGchrR0ejcFGC6D9o3VX+N+Giu+6TyTzM3UDeSoOuc="
								"data.yml (broken)":             "Yh5n6m5oVzfpk97S+jdJWLQY+X74p4KTA+4EUkl2L6U="
								"data.yml (fixed)":              "tHvxqx3e3mQknXyWeN1WVaSkYBeGgWAjzKQw4Cy/T5M="
							}
							code: {
								constraints: "0pl7+wefYIVCeg0tBJ4h9bgyaLmC+FBCExaBttFY4pw="
								definition:  "EcEyHCnhklFKHo3jRfYzC5LbhEt9la0QZG/Qqb5uPdI="
							}
							multi_step: {
								hash:       "QPH43MHLB3Q9749AS6HP0OAHLT0CHLQBVL83G3RCMTPN4D02VNCG===="
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
