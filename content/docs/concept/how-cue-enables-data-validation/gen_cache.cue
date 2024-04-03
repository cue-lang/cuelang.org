package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "M56Un6l3J0HKqOhlSoWC1EB15XnZHL+1yRBdNQtXg+Q="
								"data: bryn (broken)":           "RkHSOGxROYFSHt6OA7ob4rQvqcLpM5KcMR3hfIK+RZo="
								"data: charlie":                 "FVuTMX9UBMbFVOg64GUGJ6GP5Mydl3BvH9khnCF6Db0="
								"schema: CUE":                   "oeZjd5D15luc3GAokq2p4C+KSqhyCYN7sSqkgFgzpVQ="
								"data: bryn (fixed)":            "4UU1xwBWY2Tc1M543PHTg5a7nWd4da3nh9hXHRqd4Sc="
								"data: alex (reminder)":         "GhJpynO+TPwSAGKiYip2YQFEpVoEa1E3tXmR+cq0lf0="
								"data: bryn (reminder)":         "KVU9jnFO7R+ce5JrXFCWovtp2e1ux3LiOjWpVjffsqQ="
								"data: charlie (reminder)":      "eAVG4K/Lhmt1MR12DMhLKw3AfDfaVICp3hU0v+OSqE4="
								"schema: CUE (reminder)":        "V0XXKVj6wqIP2Xuz9BtkVeZg1qV0Ic2RRl6LvulBCsQ="
								"policy: CUE (too restrictive)": "4sbxmAbP7ThqOrO01ez7YsCyOllDe+TieA1u47YXJok="
								"policy: CUE (correct)":         "F/xoTUb383V2WyZetrCaTTwrs/NyYOxMyMrQ5Y9PS1k="
								"schema.proto":                  "KNgrUQik9vlwrzjsCl+r4ytplhYLqJsCbfuCai9iWpA="
								"schema.json":                   "NEoQedxy+N42eMgN1LLo4Dw+47EAo55DmJ3u7cpzk4c="
								"policy.cue":                    "ZvZH9tqOTy7poyGTPDpNMljTIXGVTaT7YhbOO9aG1wU="
								"data.yml (broken)":             "eqfgrk0tkR1IOaiVQaXNHwqBncl4WPPiyxrcmYlPRvM="
								"data.yml (fixed)":              "fsts3FqLbeBQeVfbeUBc9KcTee2s6Vs0d5fu8C3STio="
							}
							code: {
								constraints: "YyyV7LQ5hTdZYQA4i6g3OeOduHE4Wkk3RbLapJdy7fU="
								definition:  "QL3Hpm58FDDUuB0RrbE9AFWf1I1e0e7kJh6j13UOYFc="
							}
							multi_step: {
								hash:       "1SC8A57AEFIMKU1DIEOD18NKKED73GQ1O9SOLLQI13A1TDB2T3V0===="
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
