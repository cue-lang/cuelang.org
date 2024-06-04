package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "15SmRYdErWldVHztzo7+AxdUKL00HTcVV5gU9AkeozI="
								"data: bryn (broken)":           "IVqIiQG9GKNXqtP5piokKimBEixaTiuZ38Lg+u1+w5w="
								"data: charlie":                 "ao7SNPZLd0cAORLz49iBBRf3O9EihBhGLgNxc/1ksfA="
								"schema: CUE":                   "2w8tfsQn7Npgvwc6ffYe9pLzm8z7XtS4FY5+1jo3b3Y="
								"data: bryn (fixed)":            "PdmytjbJK8uBx0j31H7ctbZsMfnXsLZ4qQrWB6NOTCI="
								"data: alex (reminder)":         "HvVgpdoE2wi1pr38M4aQTeeNEXUy7QvrnEVkHjevMGE="
								"data: bryn (reminder)":         "XOGPWBSbanEyL9D9CVoaTrqvZ6hsaPejQARNQPnzQMc="
								"data: charlie (reminder)":      "FshtJnKeM1apAKh9+m3x+6tJIVe4qpkwtXJsnxhWM/g="
								"schema: CUE (reminder)":        "M84mOCJneH2BCUutlk3H/emiZjfQuHJ88PFLoY6SQm4="
								"policy: CUE (too restrictive)": "WzNAQoY3IIpbdtHhmcbreSFlSVgEsZBgOmvrchP1K2Q="
								"policy: CUE (correct)":         "h1shPj9KKH09JhPkePK1Bp12Ip/sjuzuHeZrQ3gKoqk="
								"schema.proto":                  "PzTIkrebATktF1nmVKX3KPJUyiJtkbWUrZGqz0rN19U="
								"schema.json":                   "Ww4ZYKMkU8NcfW33xAbMQ+B+sx4/wmXlkQLONbGRUEE="
								"policy.cue":                    "qX+Ybrhsapkgsj8KebWbJJaYYrqK2qVT9Dw8GpbqC7M="
								"data.yml (broken)":             "c5cKugGWa24x6vW+MMX3THMWLgNwYZ/3p/1K+ZRmb0Q="
								"data.yml (fixed)":              "OofRvjqC4oJyZOGyzzE2noPPWRyInKfVz/x8zFpzKTw="
							}
							code: {
								constraints: "sqIc2jw4MKFk54xEZyGRf+ScN7ihT9nQW5Avb69gyU8="
								definition:  "c4DtLlDOub0WqGskxib6slByVoy3d+DS38lf7xZVOo8="
							}
							multi_step: {
								hash:       "2VKIQ6SJEU1H3FAME52EGJ7GV9LIKPSCLIJPAT6LGBKD2I7M13EG===="
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
