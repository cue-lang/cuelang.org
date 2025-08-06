package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "gUru8+wEB398+42+6lh5gHmVLUMlcZ0ZBFdodlZ4OV0="
								"data: bryn (broken)":           "jSK0vGDUnN5u74IiJ4Z4CPF/jaQGwThBG8A8HEBD7A4="
								"data: charlie":                 "jUcUEwLShfBlsDjmQAxLNs43OYoa3+DwlgQjI6kAuRQ="
								"schema: CUE":                   "V3/t7/huXB8BAccI8ICmDTFoGmQud81sSY38dpISH0c="
								"data: bryn (fixed)":            "ShPUqmeCaS3aUvHBoP2P/Rt7gBTKz9uaNxKUVQhKCAQ="
								"data: alex (reminder)":         "9Rc5uCXiP2TxU7XKDezWXAcDBMoMWYsYvkZMTyQGyZ8="
								"data: bryn (reminder)":         "+ygMoQ9jG5Eq5FtUWtAUJwWbhkN682BoV6ykHiT+uhw="
								"data: charlie (reminder)":      "ualmmiDxWKWWGQYJyjOnP21Iv0KxfRHsxW9+xCk4pXY="
								"schema: CUE (reminder)":        "pxEiuwf3TQvc2ULbD+zW1YBTxJA9MybwEYMx7tVFN0M="
								"policy: CUE (too restrictive)": "RQGSJpMEzqWtJhzYuH9rlUcyPCYPDi+J0LFM4U65OKs="
								"policy: CUE (correct)":         "e4FOWTcb7abuOs+rIN6b4eKVjbJ9RO7TFJ1D5QWZ1Jg="
								"schema.proto":                  "Ze60NHd4wegTYp4H9iVr4jh4N3fVP17vJUHrG+Vjin8="
								"schema.json":                   "87pjQkii551NIe5OPZV+Ezp6fTjvirPRgFmpkoc+lXM="
								"policy.cue":                    "4MIzO5n+bHV7aZVbtb/tBaUyWDmfmiXfDrCWLgOqa2w="
								"data.yml (broken)":             "MLYLsSUJMHZFlZmzAX14rFd4g3kKMLJlhPeXgjLRUWk="
								"data.yml (fixed)":              "cIMNg7QaDiN90tYVBtMe79mUgnbQp/ooXnFxkq6+A7s="
							}
							code: {
								constraints: "7lO7OmzogVHfjAGkIot+BTWfiHnanLzfLqax9/y6dNE="
								definition:  "RLWObgAX6aT6qp1ezbFWoxR7pBAiK1BTR0kLYtNsHh8="
							}
							multi_step: {
								hash:       "9AAGPUMKJQPNFP382M5J2VTA2LV14R74IBLQ5ATVPE1J1RLBV0B0===="
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
