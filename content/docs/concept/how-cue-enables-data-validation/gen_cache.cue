package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "7f56MGdBYiNDVNTAWbNuOFnuUmBCCrKA+GH02J06NI8="
								"data: bryn (broken)":           "si1CSAuOehqS+yELspY2MuqetkKUWw6L0XnJIxg9sjg="
								"data: charlie":                 "u8yzfSHDCsiJP9yi3HxFhXHt6JwqtYaYlFAbc4SCT8E="
								"schema: CUE":                   "Tzf99UZ7jLugNH/Cu3KNRwzTjfutG/634+8x4pWUeXM="
								"data: bryn (fixed)":            "rezWIS5ZlwUAoXOKGXSQjWnNSVqcMEY8a/thpEO7rfk="
								"data: alex (reminder)":         "Bm3SDyOQq36/Zrychjquqjnn6LuMbkcbXbi+OGgVT7o="
								"data: bryn (reminder)":         "y16FNu9eczUB71VVF3bj9KreDIttVnJP61aP5XIdElc="
								"data: charlie (reminder)":      "VLTlVSiTmqsP4soEulrmd8LfLLq5MpASdAw00bfq9Is="
								"schema: CUE (reminder)":        "Tgg1z84nx1m7swaQaL3Tl1zVEc0dhZagDT18sRjYuUA="
								"policy: CUE (too restrictive)": "8GqtkDmTukvHEgJL87tD7h+xWoFEbmvW5rH18Pk+RVM="
								"policy: CUE (correct)":         "Ssj5Kev2OAKbNcWmnmw+58fZ0HAeczyj3DF29qSjtJc="
								"schema.proto":                  "yVVayGOtC9hsRXq3NTiyA6TdLl4XYrtxq8rIKyXuw9k="
								"schema.json":                   "e6FP4dR/k5C77S52CCkNaJODB1BqIZE2fpmr5dWmzZw="
								"policy.cue":                    "nhjmsPhfRVsahURsReEKwiDVpN7zny2hxR8C7FoQn+I="
								"data.yml (broken)":             "PbMcfEVSFUu6WODIJrL0feQlJ04r3cR2WBS07EV+6Gs="
								"data.yml (fixed)":              "cL/S+saOuwI6Ubms1sQmg3YJw0n5D0LrziMTXp5JlJ0="
							}
							code: {
								constraints: "jgsvsI85kOgrc+uQT47y2w3frvCeZASSBjgoGebG65A="
								definition:  "LSkov151jIiZM/CCaW7iNTSWzM6dQQI5JS/WDe1lddY="
							}
							multi_step: {
								hash:       "SEV9PK9C336GUJSLBN7RV20CBPI4FSA09GR0VQ1D1FK7CK79PMHG===="
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
