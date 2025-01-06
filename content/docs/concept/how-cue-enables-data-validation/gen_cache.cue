package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "zvuOWqPue4d6LSOjK/06PgiR+jnZ+3uSY2KEFNJLGAI="
								"data: bryn (broken)":           "T4k3FQp6W4cQzmUHkxnoIm2DeeEl7epfNq3EgOBPZxc="
								"data: charlie":                 "4ohi+lJg00XCMc+4IL1P3NjGhq9gCWWEpX0iK2/yHbM="
								"schema: CUE":                   "Y4G6uHIp62HIStTTVNWqW49csA7lj9VNWOWpC6PFN8g="
								"data: bryn (fixed)":            "f1CJP+XmPl1FNnHGnfgNmabLbtna3itNOPglT6/9dBc="
								"data: alex (reminder)":         "w3uckIyYWaMJKMYAqXwZnmfQlZTbzDauAgqRBnDUl8M="
								"data: bryn (reminder)":         "v1v7qRRfWvuzXG9gbBTrHGNjIh7yL7aF2WOaaB3tIm4="
								"data: charlie (reminder)":      "lJdV+VipE/KsltbnQbmrkGyoG8a/b1XtVqRj95jmakM="
								"schema: CUE (reminder)":        "Hw7yf0DKCneD0KwgzhukUw73a14E38HikMRUbckA0Kw="
								"policy: CUE (too restrictive)": "E6sOETPY3ALER4CHgl59QSkTyz94Nw94ZhC0NoWrMro="
								"policy: CUE (correct)":         "xo3iLKQIm8TVwmxVvONC94pHmyr59ED28/UieuU18p4="
								"schema.proto":                  "1eCqATT/ApTr3m5XoZclZNAdczgPKdWfhABJH5Xp04c="
								"schema.json":                   "20goSHGFZkxH+TGJ4J5aGbLAN8eYtXiupdpSR75V6xg="
								"policy.cue":                    "oR/SAMhd1VT6YKxWANRfP8BX4KuxhkTMMpU/Rn3QMWA="
								"data.yml (broken)":             "X1XLgEdtVEHEMePo+Wb1mpxnIJ98NojznMqrtk8vW/8="
								"data.yml (fixed)":              "I3fpqzrQnn6ZS9W0K94qNHWk7xVdGlb7n9CENHF1oT0="
							}
							code: {
								constraints: "34Y58PB7KuBm5hT8Di9uPsRTAWSt5FTDh4D9LiPYTZU="
								definition:  "vLl1FaO6BDX+HM2MpD5BdEjzXVRV1CioUp4IgytcvZw="
							}
							multi_step: {
								hash:       "LI1MBQFI706142EVST09OQR7CBKK2JTBLE7TEP6UN2LHL93EVUS0===="
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
