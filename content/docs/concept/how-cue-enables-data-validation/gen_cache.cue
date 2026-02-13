package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ODftOiTuKxTwYzNrB2wJY8fSCwCaSeYA49RiIWlGvMw="
								"data: bryn (broken)":           "3gH5NaFguWkp5w9X4h+IZ65ptw6bmTX6pdcYCMTgw8w="
								"data: charlie":                 "jDvsM0UuYcGcGpQasanwh2rHoK4z5GpFBvDwlQGWdQY="
								"schema: CUE":                   "J6cfnigqF17NZK2nNlMg3qZMPjsMrCbrSlaB4dhcIGM="
								"data: bryn (fixed)":            "pdS0We1/xymb/SSiq2ABcYBeB/oHkQrNlJtwmOjXwNA="
								"data: alex (reminder)":         "w15ZGf4zXeF0PAZYqBVqIWIiSmJXymN4TUhhe569Bzs="
								"data: bryn (reminder)":         "PGFFzR+26bD32WeizaxI+2FDoKhnSjESy1gVgkDxLQo="
								"data: charlie (reminder)":      "OnQJq9u0vNwKwJHWko+ep7elGIgZZaLzL/jHuLvmWks="
								"schema: CUE (reminder)":        "i6UsThNBtOK2Gt9i/GNOktfn0tDO5CDEV02Ik5QHOlk="
								"policy: CUE (too restrictive)": "83UzrMqo7rocXT3pYLB4G4rmBbiF5Nglao9lqy63XDM="
								"policy: CUE (correct)":         "5eX4GGtpYYyCm9upMi5pGy3Ud7nYfdN6j8RD9j+9g6o="
								"schema.proto":                  "o3PZLaVI4WZUs7nyldX3SCwq7bjfYJKjIeXzUoRTV6w="
								"schema.json":                   "n4yj2hnwFLIoa/BHtJ5ggQ/+0SVd+Z6Uoex91AcXypI="
								"policy.cue":                    "OWZg2oJDn36FicF/tzKxtWxakSLtoCqmpe2Yw3CXn/I="
								"data.yml (broken)":             "LNp4SbxBQXIzbAAEMvfcOkhkYWvw3P9TdOwybTgvHB0="
								"data.yml (fixed)":              "ubGkty8hMMtZVstzcHA6RIZL6NUqRFL3rO1foI3W144="
							}
							code: {
								constraints: "S3zlIz5LNXt8OekQ2F1Ca2B31Nao6JXvBmmrUwSFCow="
								definition:  "rav1iN8RML06si5oIQzqSgcXh5VOHIXqhfjUhHcLJVA="
							}
							multi_step: {
								hash:       "BDMCVSU0RU2IERO7F4C4JKI6CAJJBT1TN53S3N0M08DJ10M2AKI0===="
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
