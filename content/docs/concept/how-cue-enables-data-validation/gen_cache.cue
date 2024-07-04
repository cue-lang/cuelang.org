package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "9fDuY376UphKMj8GtizttArLWmI5Ii6x9ym5w2k3zUI="
								"data: bryn (broken)":           "pb47A1FmuPbEiCMx2L6dmuDtSENOlRHVzY8qz7jAfPc="
								"data: charlie":                 "v8lcMB7enJqhsdpsWF+TKPViNqnKLGVKW0S4GYweGkI="
								"schema: CUE":                   "/qn3cnracbsMc0q7cLOvuR1og92356fnOAH+ZzWagIA="
								"data: bryn (fixed)":            "FWW9C78DRnvlnFvk7tVo+ahHcmfBvN9o0cDQC5Ircfk="
								"data: alex (reminder)":         "/mt7qcTHFdzbsNA8S3Cf+AmGMj1+dKXg4BqXoPPIsW4="
								"data: bryn (reminder)":         "XSYziBDFAQ/XutFzmK3z7q6fS6KyWDHngDxLgF1apAQ="
								"data: charlie (reminder)":      "AHvhreP1U5AH3Drqt1pF9uhbMr7RcbpraV7enzRgiig="
								"schema: CUE (reminder)":        "YNL1Rb4p6OLjzsWSkalXtMcpRBMPkrwoLi9F4e8BZtw="
								"policy: CUE (too restrictive)": "yKxm8PBi2p9eBLox+NNyvseBbLY4ytQ0cmMgloyTuys="
								"policy: CUE (correct)":         "s1pcFdKxEOf9YQlACYYVOB7aPjqNVjLYQEC4u/XiS6E="
								"schema.proto":                  "cMTHnBK0j9E7hbRyiama9+zdeg0yyv9Dhwc/xlvcuxI="
								"schema.json":                   "66uWkUo7ZgCsL2J4PfJTRTw5SjHNIq48smq2n/JqTGs="
								"policy.cue":                    "wqTICnhGCZdIDvdR6rs5H8zf4ad3ISou1aVQx73E6J8="
								"data.yml (broken)":             "1gW2zQENtI0qQ0mzlOP0VbQuWZ/wlm2bMUqw63jLb5k="
								"data.yml (fixed)":              "frtAsyJOIUNvXhpdySxJ6/WAVSJCKqf/cYBK6FIswIs="
							}
							code: {
								constraints: "+oGk2+c1n742JU69W5/Gnyp7QCcR2Wcif+3YGiT9TGI="
								definition:  "U60n+Rt0BTjfyhYzPl36NSLYbTzugcv6VrPOJtSCNHs="
							}
							multi_step: {
								hash:       "JCP1NKJ3BTDOMK0TQBM6RC7ODQUJHK8J2773IJURSI7H9UU4C1JG===="
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
