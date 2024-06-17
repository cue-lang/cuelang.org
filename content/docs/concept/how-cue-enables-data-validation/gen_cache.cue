package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "SL3K5Iz3V5AzD5q2PjJlBRDu+7JJ5PDdHGXxyDcSuPc="
								"data: bryn (broken)":           "eG81T/cS8wNqT8GJmr50TanUBzFKJol+9mxlG0/67sg="
								"data: charlie":                 "us3NB0yplKTwIN7AQqn6FikihVY9N4gwNyYh/3eH3eY="
								"schema: CUE":                   "pjf0aDLuessnphD5TdmlxRB1UAPvtXuRrVoTQnwt8jg="
								"data: bryn (fixed)":            "alKwA8/6HbwbTVrW/DAOOvEtAvYKSERhFszH9mvwVKI="
								"data: alex (reminder)":         "mkAd+AX93Z4PzN6RAaLw8+6/w8Hp++dc7BWIcDzOMFo="
								"data: bryn (reminder)":         "GCwrLrqfCqyEKOHv2ft21heCoALf1SK2zYvRF1ZE/i8="
								"data: charlie (reminder)":      "o5+YCgUjbujTLK5mApsMXWHW1ujHv1awYr2z5gK93as="
								"schema: CUE (reminder)":        "VJjKvUBkmF8qvoX3Uf/Stby8HCO2ScFeADaScY/U100="
								"policy: CUE (too restrictive)": "Z9ETAawff/dhPtqmdCuBKGoWFroRg1ViTFWU6hfOW5M="
								"policy: CUE (correct)":         "PJTs/A1mr6fOXNqxSZfF8Rs0ZDW22QUYgb4s4+fOI9A="
								"schema.proto":                  "nRWfi5tzM8s+Ur2Pkihu4+T6BG9n8J8kImmSrvYG1dk="
								"schema.json":                   "7ebCoTl62MXZOQaO3uuk+GzifizVdLiXzpMupi2GDiQ="
								"policy.cue":                    "wjQjqZ7HVcKpx8qi/Tfm1+LlQEx/NEmGVwFFh7NZjPU="
								"data.yml (broken)":             "xT8NbKxXxAhmdArx5FO1Ot288ZsfTFSvwbKGeAQnqZA="
								"data.yml (fixed)":              "HYpLbmUwiVKnugUR2+fzSFmem2gK7EZgLRX8QjOpTlA="
							}
							code: {
								constraints: "IgeTjFk1bGsonpjLDY/D6cq/+woghScGj7JEHlVDK0w="
								definition:  "SBLsn/8GOHo0V/63pZL+sdpPEsDO6MV1Ea3ihShNh2o="
							}
							multi_step: {
								hash:       "E6R3DGU1OF2GQ310A3INHP82PRBINJT0F0CHSDGKFCC73V118H3G===="
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
