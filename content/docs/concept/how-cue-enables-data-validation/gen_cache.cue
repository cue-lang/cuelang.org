package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "/5NycdM48VdzapQPmUlOucVBKuOeklQQzOC7APMBGvI="
								"data: bryn (broken)":           "plWhlaeNLKzGKT9+f7Kws71oOV/BFMwjlwiicfcJ/hM="
								"data: charlie":                 "A7pSxZ94xV6HG8T99CMvxBn6QBubj1ti8q/w/dV09Xg="
								"schema: CUE":                   "u+Hw9qcVZwn2Wb7Qxy5nRIXxjs48ShYQyeTfHtxViSY="
								"data: bryn (fixed)":            "QmDGxeqm2cTQPWTtOktelP4UbuW9mZVkzL9bx2yh9gs="
								"data: alex (reminder)":         "bffIFpEDDOqGGft2WYJ3xuiOfYoSDwdx0gOq5DxNGXA="
								"data: bryn (reminder)":         "RSZVTBki1DQMCskReXLl5lA22PKBqao96s7ai/ghoF0="
								"data: charlie (reminder)":      "rsksYsPxWLgpeHrx1A3PDuxEeMy/y2ptaQZ7M4ELXjk="
								"schema: CUE (reminder)":        "1q1Zqlgp6EnG/c8eOx+BAYpBiO0GQdH1VXhlHb084ac="
								"policy: CUE (too restrictive)": "tFWeDNd4xHoVE/AVHsSiBTboR072+d/5FRwdxv+ng1o="
								"policy: CUE (correct)":         "//fU1U7s7+0FeU28x/wOekPoPvdIbBLCXmXPgWm4Rvg="
								"schema.proto":                  "BSUDW1u7pQz5fvxUtXGaHLXDEKqqj2DmoSmFiRilqIk="
								"schema.json":                   "X9nL3EU7NO8VDI6erFxers0e/uT0/GaIwMRn0C5tGbQ="
								"policy.cue":                    "/gjv9qo52mfDkrbw+xgtlPYwJ+CIIVCtLuBwadI1ljc="
								"data.yml (broken)":             "AVZ6pFNuiPrClywy4CSOuRZJ2S04EAblrarpNLe5+rA="
								"data.yml (fixed)":              "/iYXr30Lv1aqqFbQAW/TeEImJS5C13hSmScuUFDR2zg="
							}
							code: {
								constraints: "pfTlkp+Woa3piAqvuXIqGumgx6NaPCEhxe30tobwALY="
								definition:  "MO7kRlnzNoL2Lba+lKKmv6i7BolcUvk+/jnY7E7S8DI="
							}
							multi_step: {
								hash:       "DJGEV2FGEBGCF0UN83E2M7CI1MNK92J868JK94A3E2I6BVF1C67G===="
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
