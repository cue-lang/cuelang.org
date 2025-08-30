package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "iYpq/lCa/+neFONYpJnB5bbnuwPBFUHiRcmMKw11gqs="
								"data: bryn (broken)":           "ze+xdUKzAjfvl5MVs8OOQEDbEhZbKMr61xixd9QRv4w="
								"data: charlie":                 "wExl3duHEdtPvn55z9rTSObfrynUIIcj3riSwKHw5nQ="
								"schema: CUE":                   "mXGUqhzs+St5mFlI8Z0Z1YAalkd3ReK7jykjBFHlKV4="
								"data: bryn (fixed)":            "BLiAEV3UgZ/wYzSc527Tjay4HlEh1SU66wUT+hrb0eY="
								"data: alex (reminder)":         "/LTXZcgDkDG3zQBdPu2EI2xfUv6vVqU0rw+sQX0DC0M="
								"data: bryn (reminder)":         "SQI8OtLiNxk6FuwM8CBrAx0v5pC7fJcFujoksU7HagA="
								"data: charlie (reminder)":      "HeRoHfTjyL1TnvMTGYM5feMmsMx6Mw367QAahvjZ9+Q="
								"schema: CUE (reminder)":        "YcrxHGlkM1Yafwyn5P9pA8gDMeJh8fuKpfnZO5YERXA="
								"policy: CUE (too restrictive)": "FDA48lWcxQ3bRh+hYU/67/8Kf1QxMOE/P2bSJK+EImA="
								"policy: CUE (correct)":         "OWObUD4KUKk3PoGBbcQij2ncq9FzaKrrjyaWu/aaof4="
								"schema.proto":                  "I8pY0FcR3oYVxApjT0hFltiqwNNdzKCM2NdZOCw4VCk="
								"schema.json":                   "C2M6yM6PvuXB7hE8gP69AeF26Vw5nv16ERYPcC1SAcY="
								"policy.cue":                    "i4IRLxa8aa/EfIkFHilntZAWkmfqnIxd1GtV8JWUA6Q="
								"data.yml (broken)":             "dlfKE5sI7CReryGwB1CuZSY8QSZudPfqtglzf6pcglg="
								"data.yml (fixed)":              "O0N86rqY2osZh09c0UD2ongzg91dvgcyTVRHCUMaeyY="
							}
							code: {
								constraints: "qM6kD8YK+eCMBbroarjuf+dHANHJ5xbFAm4fpXsAW/k="
								definition:  "WxV4PCPLfvcy+dhJUmsaYfkrQurUHysynNshe8lRgqE="
							}
							multi_step: {
								hash:       "1S9ODEHM0KUST8CEAK9485KMUU9ABDRL7UC9UEES584U9F2R3JGG===="
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
