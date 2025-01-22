package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "t3aWjRVQyZBgSw1x4Y+Re4/aTuSA7SDPik8iuO4YRY4="
								"data: bryn (broken)":           "/wJ09eerS8BvHRVxweneWdecK4jryrxfzzRhp5N/t7Q="
								"data: charlie":                 "Kgbds4UenAq3Hb/s5Kem1zDf+4BQvBQmm5i/Ip5huYs="
								"schema: CUE":                   "Rl6Sit5C/X78+y4a6E4rjLrXoTdqJi/4EgOwHWREpaw="
								"data: bryn (fixed)":            "5hgJVM7GvN0hbQSbWBxO+Z3NHxLgAIvTohIzXdTvlZE="
								"data: alex (reminder)":         "bo25u4fNBlloXqy/AGRMfFaAQ4lNmNAQsOIVbgvPY8Q="
								"data: bryn (reminder)":         "zBxOvO6N4HlaXCoyGjEfDW8+czbukPoloCvh5I3EObw="
								"data: charlie (reminder)":      "JuBUSoon9kZVYZRVGrTVnoP09kMlosHD3JLD3wNucgc="
								"schema: CUE (reminder)":        "bITbBMgWZhQ4/TclLfvi6KnLW8Gl7Fd+1TWlYQ5U+W4="
								"policy: CUE (too restrictive)": "E74nE8TPcE7xMKHYlNlAX/O3j4bZYHnUf/vbTURAygI="
								"policy: CUE (correct)":         "taBeFV2siVryMhdQQaXz7dC4+2zCr8JBzj7jYWAjNu4="
								"schema.proto":                  "RPz9Vudvmv/SOj85SnPxVOf3CfRADfQ7uCeTd/GGeSs="
								"schema.json":                   "KgQRIQ5VgOtJ9B9NxDtKCQCa4iwRi7/yI7BqEyDQ+KU="
								"policy.cue":                    "Kfe/WgBfUIN3uEarpIlTxF04aQcPrpQ17ZpYjv+Z+fE="
								"data.yml (broken)":             "kJhe0bJIG2Q7GULNqxkApdmE1GGIOnLg/rRmgIzPDYY="
								"data.yml (fixed)":              "yiLqn2eA4FxTSlcBKPX0qmuMSmFJ7LjAI4TcnJwxiHU="
							}
							code: {
								constraints: "FNmZnDJ6QR/NhNaYLWfG54klDtCqz+XooqCns+ODJmE="
								definition:  "BjApwV2LKDFF1lOdrpZXgnte7RXpI0KgJfx89nVgYOc="
							}
							multi_step: {
								hash:       "JCID9TPULBL25HRFTM6ITQ2VMTVC2S1JNEQ744P6E4I065K9MIQ0===="
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
