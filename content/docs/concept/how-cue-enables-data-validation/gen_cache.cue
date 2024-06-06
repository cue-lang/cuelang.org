package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "af7VdANx1FSdFvxRoqqdIX9llKcbc0vpzwg2guBEscA="
								"data: bryn (broken)":           "fLIozU6cwfH+Q10ZErEmQKo/2kRUpXJ7zLsv+BbEy9M="
								"data: charlie":                 "jrIH7eW2mf+4mLaJMrgsZ/CD+9kvqzG/pAE8kH18RDI="
								"schema: CUE":                   "05h1MHW93xMlZkNjCKT9HsbDVayGDYdbPz06HaRSkKI="
								"data: bryn (fixed)":            "JmW/R9Wqojhn+Zdm95/pSQxVZP2aN1UcTxSPYYzgVJI="
								"data: alex (reminder)":         "0Q16b4mgA72djChTHuThdQ1kmHek4tBsRgMuxJeD0PQ="
								"data: bryn (reminder)":         "ksN/BO645shXFF8x8hhJO/Blm3NL7CAsafOFg1jgHJ4="
								"data: charlie (reminder)":      "rCyYc2TeYYfzBDvDgUyttZBefAo/jwpcKH0KOGi5H28="
								"schema: CUE (reminder)":        "2YWducVEUOcjqXfM1BMJzFUXKHMmbxzz+B1Oc9v5RdA="
								"policy: CUE (too restrictive)": "iUcDWgG1S2GgDsl6EQTJaeSm/PHtz+rucO2CxMCK4Rk="
								"policy: CUE (correct)":         "NYHrxuI3M7fDuK/ug6ML/2mZrxXFjnzMHItQGuAODjA="
								"schema.proto":                  "tRJJlgWpWcOOD8Ei07ADcvMyZnuX9ww+Eoomr9uBuNc="
								"schema.json":                   "KHy9ZoV1MmoiuQbsyPepGNfyZ8Tquz1M6TLvRRg8wxs="
								"policy.cue":                    "6O1VaMrc8LgkBANuII8wXEVGiM7Xo4l1iEoiHupYUfs="
								"data.yml (broken)":             "VBUOFxGUpkF35jO/MBPmnqmfKQhkzMgcBhoAgtbmqlM="
								"data.yml (fixed)":              "R9rfWQqq5rLfGnwxQFjzfG+7jEDlvo6xkmLTDvrYWXQ="
							}
							code: {
								constraints: "dUuuWpyrhr9OFLZk1AXEr41EB0Y4Sv6fKV6r6ort1Gc="
								definition:  "XD9kBYva8Qm54DN+V5d19CT5P/nz5WWV7PV2U0BSvQg="
							}
							multi_step: {
								hash:       "K58BBDMM6JDEQFLCSG3ACNU9KHH5M31HJ5A80LHMR66UIF6NUNTG===="
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
