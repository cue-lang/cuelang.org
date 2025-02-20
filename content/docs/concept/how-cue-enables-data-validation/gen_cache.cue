package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Qw8xwebA2zQG6mEBfonioDamY8pq3+wpU9TPe9r3sAo="
								"data: bryn (broken)":           "YqLPWOr21Tl2Brxq2PBZq+QjQWVa+Ntqh0szGSwqsrA="
								"data: charlie":                 "XI3nCDcB7lY+SYM/W+av3jFlsL3HAwPmOvAAo2XZcao="
								"schema: CUE":                   "iWgLb5Al61oYuIcEDIU4sw+ThnJ7hFovrjXkwAuDhOI="
								"data: bryn (fixed)":            "snb4RzHZtHEnuLfrI15kTqyhuXQqq2H0/VK32zDt9iU="
								"data: alex (reminder)":         "OM2iCINvWelEV4plAcl6v1NzKRIIrPQ74mEugJx1298="
								"data: bryn (reminder)":         "UisbKlbPqGBqLaHm5lb30SN9/VNMeR5Pq7QLo9U0kMs="
								"data: charlie (reminder)":      "KK0Ek+e/YVCwMn9Mp3Ulqi2qsiPMHvVcnZI8kTlZPKw="
								"schema: CUE (reminder)":        "iyHaUWL48f/N3d2NzGY8m0Be+z6Cz9G0Nkfklqm06CA="
								"policy: CUE (too restrictive)": "d+p2ERRcfq6p+lHpDFhS+T2/tL3kHegt9PCiVUZ+cwE="
								"policy: CUE (correct)":         "d4bgYDHPJHZmTklmdUVgASF+4HtZaHhqdhEEpNgPVXI="
								"schema.proto":                  "a6QiJUBZiVt8P4qRu03ZqGlakJcTl2w8EUh4f9lZYmo="
								"schema.json":                   "AWUMNxy6ypuq+547oXUlrwZjdwUNpxRnxbVYSvqriA4="
								"policy.cue":                    "adLAbBT+4edOKUdyihcE3yG7E7bswihUm28k1cZDuvw="
								"data.yml (broken)":             "6bZKoDq7P5DWtPEIkZuoOMRR3IYQEgMdE6mHPvR+ZcY="
								"data.yml (fixed)":              "LXPTNYccOUSnKbf4jpbPfSgoq7ObjHxZRaLTAkZKEMU="
							}
							code: {
								constraints: "tfB4BG0c2hA3DgQOtdW5TkG99nMusbCDhdpX/YE+z8k="
								definition:  "CD0ka1T8ryHAZSeTTurjz6E0yw6fEFtwXlS/Y9QvyNE="
							}
							multi_step: {
								hash:       "DNTSSBF49FQPUFB70KEHC1UHCIO6AHKJQNMO2S12QKQFIO3KNG0G===="
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
