package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "aYgJRR4eIhUeCnyiM800XOLNDNhV4ik0T7Nt2obiQak="
								"data: bryn (broken)":           "f+j0/idPaPq//WcQ5TtgSrUXIfbSF0cfX5v6NlEJdpc="
								"data: charlie":                 "m75BP1BUajdZY6pP9seDWxKANEVrrs3ipmBNmU7bJe8="
								"schema: CUE":                   "dH53cZoScoOdMP7R0zgWxwfxFO+ib3rqm3F5MX4Q09E="
								"data: bryn (fixed)":            "ZvsDwuVaZL3apdZLW/Xr1NselbochJMRP7gFc+hA3Q4="
								"data: alex (reminder)":         "KKwL81w42s6BMjlIODK3kOugVas32jSj/jv2+sriMR4="
								"data: bryn (reminder)":         "I90DMMjXY8XKqAmejGFqMoz9IBXTg7DqWdBi6/0R8mQ="
								"data: charlie (reminder)":      "84WnZP7AUq854WWoKUHhc8/xJVz9ejDJBlL6ilBFFO8="
								"schema: CUE (reminder)":        "3TaPe9oCWmErEj22HGSTbWWhmbIOG/TmwD+07Z2+MG4="
								"policy: CUE (too restrictive)": "0UbBJ/rbHmmjTxfo9Qka6FgNGNd6xch3VoK7XCOCWuw="
								"policy: CUE (correct)":         "o5YhCFZhNZb2KLCPgM0jLEEGP0A1hwZVd5B8WgJHuBw="
								"schema.proto":                  "0736TIHom7sElHFs6gtmaJiEtCb71ZZrEVZxDiJ4sqk="
								"schema.json":                   "1fjMwpF6RNSG6CN8J1cRYUtF2e+IxUPtKmYg+MP5mBs="
								"policy.cue":                    "Pdt7d2eh7r+swGZXDD3C7BwSs4IJHA3Sk5KRtidGfj8="
								"data.yml (broken)":             "OAiYMer96hAlhpVDEVHVSRC4SHMf4Se0rdRtNRu7AnA="
								"data.yml (fixed)":              "yq36B0PoeE/MvcJmIbkINquAwNYzHeFwdVC8FUoQ9hA="
							}
							code: {
								constraints: "+IsydfOkFj53T8aihvcrr5yqvr6woyq0ZO8ahBYHxkY="
								definition:  "1Zx22lb0Lp4Yrttyc8VIoohG8VaPbPF8EvkwRLvDN94="
							}
							multi_step: {
								hash:       "PAMEKKSUGHIVC99ERFQ5K5JS4URU5JMFT711725GUU3THNLIRGHG===="
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
