package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "BHRdnMQi41HQ/zaJcbSQnZILP8HKOsuWcsLyb6hkD9M="
								"data: bryn (broken)":           "GsmgZ4ri1YfNfNpXLYacXUsvTVa+UkaO7kXNMIgJzVc="
								"data: charlie":                 "yT4DmhVw2fwx0pH+Ocrqj9fryiL7L0dU/8y8vFQ7rqw="
								"schema: CUE":                   "WoakOFpT3DLPA+OTkCr984o5c7HCXjK5NcVJwEHEB0M="
								"data: bryn (fixed)":            "5WC05N5dI3p6Qn+JtVc9vpUfcJueBhzbNFuTUHzJ0NE="
								"data: alex (reminder)":         "teijyg6Ld0vT2FNu1hkVReiGRbnn0tTQ0X3MjTIFhoA="
								"data: bryn (reminder)":         "Ub/mr8vY4m+RkzPB9Kv7AQCBmqfP7axWPNbnqGnP4Ew="
								"data: charlie (reminder)":      "9BtVf3RudPYB0p9UDm6nzoFFUtWj6dYEKu++1ZtL6/Q="
								"schema: CUE (reminder)":        "13ABoq388l02SqERyBoklh9eTgcuOhaeSEOVrZvr578="
								"policy: CUE (too restrictive)": "SpB1F0FiJuxSXvddlxEU3RXMD5QdSMtHfY4wTFQQd30="
								"policy: CUE (correct)":         "PuFGRop3WhSoWfobdRIPPaqQxfiMmOQp/QinPjgKRDM="
								"schema.proto":                  "Mr4oZ5uKB0RUuyOi4Y4SK03PvSTRhHgZ3uXymapGpCM="
								"schema.json":                   "0DClkcnwHReb9CUrOrXLuDZn4HLgX12Ys/cVx+zv9jI="
								"policy.cue":                    "YSz/stPQ9fWaxtI+4H80FngToFO26sD8i1ERToblclM="
								"data.yml (broken)":             "CFu6KFhCwghYVmxjHYprq6Q+PmQIhYKMYgh6MT+UKwM="
								"data.yml (fixed)":              "PXth2S66vwngNzUSeKMR/2yl0uPNWTSV/3CfGpjaMWE="
							}
							code: {
								constraints: "QGsaTbrfOhgLeTROA3u8eQJPjgb3vkCoqMZhXBFUN0A="
								definition:  "FRIHOFMU8AtwNXXk3G6Eg/GTGnqtxBU4DMTXImo1k/4="
							}
							multi_step: {
								hash:       "1K3NBJ7RJVK2E23VHMGOK6E5H8BC3S91BVF38AFTS2AONMQ6MS1G===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
