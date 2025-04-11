package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "eIMZJcQB6eFPri8/vWp5gYvtpnznA3UFpZ6iaziKMkk="
								"data: bryn (broken)":           "o/7tRUWvqilhmJw/X0i5kog5S5mdIga2BoUjOP/Ng/M="
								"data: charlie":                 "HWjUtOJGmy/+IaQ6xtC2fPvtUgdLOQLngCr1sXM8kGs="
								"schema: CUE":                   "A36TnBVPkZz1XCENCPr5PLGZCsITGgunF1vDb2gMFK4="
								"data: bryn (fixed)":            "ul4vV8KXtmkhoQ4msFjQyy8QyjeHus+0mpX+SF5Unvc="
								"data: alex (reminder)":         "cA9V/aKFfjxaJYiKL21HtEQor/qHlSgDQtHFx4dh6hk="
								"data: bryn (reminder)":         "55beCKhxNLq51sTzsimYI99TGxpI/8+gBcfcfGFiN4w="
								"data: charlie (reminder)":      "RCJgVb5z36rR6EvfwMZVJ6OQMHxioocJNSodc1fC3Ao="
								"schema: CUE (reminder)":        "pdbmU3Ctu4eq18cdlpiXBLtlpN5oF46Xr3X16w2F8yY="
								"policy: CUE (too restrictive)": "iXCYqAASktqyNCgHkUhm9Zg6ZlWvqj0cPbSxkiA0jko="
								"policy: CUE (correct)":         "HC60zxq4y4Rs+o6NfVCinXKZhDbgwnXQUVkaK3UjzGI="
								"schema.proto":                  "5Fl5yoeoZBxQ4sOnf1/0p6KNJ/RW3zSmnlruRd2FpE8="
								"schema.json":                   "Mglh2hb7XDpfmlY36eZB4S8fPaNEXmK6N6kYqkkS21M="
								"policy.cue":                    "5D90gHwOJ6/+ncQcOVel2Kt6+FMKt/bM1BBu9YypLMA="
								"data.yml (broken)":             "hUwQ2hIhuxbF+QAh0HumOBfyONtv+lc6OyuHQbZDmqk="
								"data.yml (fixed)":              "Og/FLk9ODIydK23Z3smlyFiaFy1Ow6pbhJEssa6nKvQ="
							}
							code: {
								constraints: "GcfSPxGSHJxKyWPzD/hDc2vh3EsjzLsR2CTUvmdeoTY="
								definition:  "NT3qUGNJGcp9qwLGQNAIhtbOkWuPICFlOHQ72CuiyLs="
							}
							multi_step: {
								hash:       "NJN6E3CGPQUN0OGKHCRIOQ09TE6LFEDPJAQSGFJS4NBNAH7SDL70===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
