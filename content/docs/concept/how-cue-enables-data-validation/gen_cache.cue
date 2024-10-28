package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "5YpT9EXEQgP3tFpMkxCZFww1/Pr8crqav/VOE8OGWFo="
								"data: bryn (broken)":           "DgH9YtkAbOi7UsyIngKJ7qjcnqskbJUH+jBzyH8HDC4="
								"data: charlie":                 "CtxLo3i7g9JnSr3DPt662mC8O/MCK/uj/R4EnLHe0qQ="
								"schema: CUE":                   "pASMNkXhRT+WTkRYeeFQ1zJNOPQhGLN60frBTRvxRSI="
								"data: bryn (fixed)":            "PDZ6922aJUlwe7AAmEMh1IEc1GTC5IiJrbIREA3pLBM="
								"data: alex (reminder)":         "Yu6wfFvnTNQBNkYFpSfFVOLRgf9xMeZkt6qJbzC7RYA="
								"data: bryn (reminder)":         "nQhp3tEW9MiBpzDQVZ9vYN30iu0jsjFXq86v36414vU="
								"data: charlie (reminder)":      "PYtn9AodgtK/ZdCzM2TM7CdoKPWnIpwf4MVHUM2nsAo="
								"schema: CUE (reminder)":        "ne4yWoq1/0ToPg4kh6J1WqNhqRChlVt1K5E1/IBL0N4="
								"policy: CUE (too restrictive)": "rYzsDbGCStM6R6tqOieO49zgxeYvBhSncwT7VbLdp1Y="
								"policy: CUE (correct)":         "3LXP9OSsSydGLdzDCcm6fxfGaX6zz/YuuKFymrG+Ecs="
								"schema.proto":                  "J5LD2N+AkzfQ0lapgbZEicAVUPaqBfa0CO82skBZ8SQ="
								"schema.json":                   "YSHuW1bnhc4wh+h8bgH2ZacyAr7evHIT74+ckP3cc/o="
								"policy.cue":                    "Xn4mlo3uCJyy/0DuP9vSMcsgbH/jzY0tu4GOEc9x67A="
								"data.yml (broken)":             "mWgt++hlYBAFp58YbQGWXyCGhByizbI9KrVWIAGgqZk="
								"data.yml (fixed)":              "dMs1M2BakErWXvcEFekOZCfsVRbrmueRuucOM13sB8s="
							}
							code: {
								constraints: "S1VzdmdX6GCuDAYZnjtRtVomSY1T8L1BLQI+05dqr6I="
								definition:  "98qkiee47/lizQ9AN3Bn7w5AWLeZj20UCbSAzzup3cM="
							}
							multi_step: {
								hash:       "D4NS05VRF9Q6UI1KRTB0SHP177QEQ947R8KULDLH07VKM3CDB8O0===="
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
