package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mCbsqT4O2NN22tcyRXb4ZzyvTPV9EYFs052y3/cQuI0="
								"data: bryn (broken)":           "7UGYCnBkIhNTjWL8K+fkInFqhKsOvG0qd3EX2KtnmBw="
								"data: charlie":                 "s4o0VDmbwJ21Io0lsRBtvK4bEnbSaKm/TrAyp5zriZ4="
								"schema: CUE":                   "dC0XRTWvfSVuR0UNb2b6m/kRPOlKDI3CgY6wtiJTbmI="
								"data: bryn (fixed)":            "/SL3ygRFb54skQdGuPozZ/uKU0/ostmiasH9oyxDOWw="
								"data: alex (reminder)":         "0d4X9a+u4ipUBjJ6xBZkPMT3nVI7+WKVttu8q2NFycs="
								"data: bryn (reminder)":         "Qkks7H2Hs+8ju9Ei0cskH4UNSJ3BfRJTgLeIw6SiXt0="
								"data: charlie (reminder)":      "nyCsFnU/chqP0jVJHJT06B/uitVb64ymDdZniU8otHU="
								"schema: CUE (reminder)":        "qU2OuxOM84gigfxz/8JaMsV6Nx7STY5QgIp8r3pXWO8="
								"policy: CUE (too restrictive)": "RmgHP4vYNzAhyp5Eox++zVxKvjhSh1OndxCMyOzT/4A="
								"policy: CUE (correct)":         "qoeRGLXCY8qNi52CGcSVM3plfXxb8Iq7LweS1TM0KYw="
								"schema.proto":                  "dMrGbfKgM5m1ITZ3ucqPvWT1ibOT/vXe0jEFnlYIT6U="
								"schema.json":                   "ZqAVsdiAHeVW4eCUg32RSoMLrvyeHe4wBZOceplu6XY="
								"policy.cue":                    "KdYUZxCt9pYcGZhVpp7JvslmNYgUow3h15oGTh7wtKU="
								"data.yml (broken)":             "0AeLQ6G7IXjZ6OsMd1GqTonNH88wU6O8+99MX2hbOro="
								"data.yml (fixed)":              "SbdsOyvqWFPUV1Vk710sPTplEOdhqByaV5+zQmNLA98="
							}
							code: {
								constraints: "VN8OJqiJea7q1ATcBFTzQkX9s52jx9xS5ZpzhrfdXYk="
								definition:  "HKC0/dmPcouzLlBfX13fKWtN6AlX8DbSRqrdAJrS7/A="
							}
							multi_step: {
								hash:       "QKJA0IS4TC9CEMBKAUL93OO3UGMIBCRGTR52US8F2PFG6SJT3B3G===="
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
