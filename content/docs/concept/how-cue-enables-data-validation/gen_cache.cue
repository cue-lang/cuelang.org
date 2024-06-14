package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Cj50zQ4sCH4MVWyc5vwo1ugnOkQ0R2pAdFM+vYxuviU="
								"data: bryn (broken)":           "Fl2kVKYnQ+7A8LJO5TBtq3ZbWiR0LVW/ofsOTCo8bvc="
								"data: charlie":                 "PuqxvvK0it3COVVNLMXNxoDPD/z9rBr3dMFGuMp3kEc="
								"schema: CUE":                   "F13NcFb2RVJUGK3mmS6+Oh/s81Su0JITPmRZhpknQmM="
								"data: bryn (fixed)":            "PIB5T9fhY2MrXCVTClGV8HPGnZoiE+v9XQml3tRsx1I="
								"data: alex (reminder)":         "g7TqzJ8oHCLkBZMNgfbKPPnwz1KVurzTQHTYHOMCkUk="
								"data: bryn (reminder)":         "oXDr+JOU1VWaRD96Cs5Wvvtvl2aQuxdKDTuKayqDCfE="
								"data: charlie (reminder)":      "eKoxdpV/PNiLPz2mO+9XEw8qHNQcWaEg+mpZABOGDKQ="
								"schema: CUE (reminder)":        "R0vW64x7V+kJq1wE2BB6JQQxCCLrRAipfFJ6WBpFdVg="
								"policy: CUE (too restrictive)": "b4RkhzjJZG0pbeGEwuahnB4zmg0OKBKJdMvL1pPhzuA="
								"policy: CUE (correct)":         "0Vbvqj0tFwt5QcyKgag1Ge4kmz9Z+dlTb+vH58ddwWw="
								"schema.proto":                  "d2bOPJOMtzpklT+AFiWW6C+cILEZDs0YwK7H2fYXqo8="
								"schema.json":                   "cg9si5I/+X2RoP9vG3UjUFzCKH5kaacok4+EmAtHz40="
								"policy.cue":                    "N8nyBNeuGJdot592fOMUeOIHn+jxiyI0SpUxpU+QOlo="
								"data.yml (broken)":             "LxgQ2gxzSBbF34fr9VWJ1/CL+3iGz2elfymmHtUHXXg="
								"data.yml (fixed)":              "RyEKzEtPv0LnEaGUIhbadtNzk3/emSsYQ26v3MRwhto="
							}
							code: {
								constraints: "4UcooJutzKdCGNg6/S7SmZ39o2kbzDaxI+Wy7P3h9/Q="
								definition:  "SongeagR1/+65JYoyKuzxV42YPaQoT4G0olCi/0KadE="
							}
							multi_step: {
								hash:       "KNTG9M24KGF0G8JKEQ0TN7LQHQ5C6F1UD4VUF8TGOTJF693ARQIG===="
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
