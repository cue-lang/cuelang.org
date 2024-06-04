package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "jKPIIjyoopQ6hF6QdHgT+/JAGQgQpf4mqXWvWEw+5xs="
								"data: bryn (broken)":           "DBw9jSqs7InQM9MQ6VMdoIiqz9UnIEazHYT9U0fKks4="
								"data: charlie":                 "IEsCqtHk7Va94J2gJK9t+PZN67aLFmCk/yisuPt+cyg="
								"schema: CUE":                   "tuZZ2SBrMhN1CXd28gGbZLX6T6pUsUSdBJGwedbdsrU="
								"data: bryn (fixed)":            "uETDfHmg4O/AZM465ovSZCrX2Dfw793UGlpe52ALU5w="
								"data: alex (reminder)":         "jUmsLcI5fw5vfQV+26MfhpRVgjYCftaCrhmwJYMpFu4="
								"data: bryn (reminder)":         "1FDbhakc/eVcVbh+dw8NvE98d0COOF8VnCZk3aDvebM="
								"data: charlie (reminder)":      "jv/JjhRK94n5NpZl9IQRIbQJw1O6GnHupZp8x3MdsYs="
								"schema: CUE (reminder)":        "5tZUq9nXfT07BawbysPYJDbVSsBKuIkUT8ExSSgmFxU="
								"policy: CUE (too restrictive)": "Tq24T1Hcu019cGpDjXCrnJT821f7wEerAKOcpsIEy9k="
								"policy: CUE (correct)":         "FAWstOiH4EYTW6Ka+PjvNxrB438mMPPOD75KXWON7Ck="
								"schema.proto":                  "OaO7CrZ66lWuF4vo/Z5GhqZ64iizyA9wTFIhsN4hrVc="
								"schema.json":                   "LaDCMnTn6UzRj8DUFGKo5QO/GawVjmrpPn9endMlSos="
								"policy.cue":                    "iQlM2tNV8slMnAxjNyy1r+rWPDkTFsT38nRHdEEj+XE="
								"data.yml (broken)":             "sLBMXFM2xX7Az1cyPUeNtaxzaXR2OC/ODsay0nt6d6g="
								"data.yml (fixed)":              "/4jpfepeFWX6RXrLmJVbYizT8CrHSEN7Zy2zXjpkjns="
							}
							code: {
								constraints: "9ZUgygJyDREG8BuYm6WVwKELkwhP/MDbfz9I5ZPrAI0="
								definition:  "5IBlZzqGbes6F4ushF8d77JCry9gmOpzUTZ4dLgyGQo="
							}
							multi_step: {
								hash:       "O5U3TRN23LEQ2GV2QD3KP55BPEEDBRU7F9MVVEN6P6UT816HCME0===="
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
