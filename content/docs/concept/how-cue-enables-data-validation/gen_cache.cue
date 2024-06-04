package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "H5hp0+Or+rcYJOS4iyxV6UNrmKW9DCXmwsAXEnLABYQ="
								"data: bryn (broken)":           "3j9aptEXB39+tioYy6uPWKJxVmigFTtaMq6DS7i00Do="
								"data: charlie":                 "oh1LRhfFIP3vdBmXHtmoyef6duYWUzkVyTYx0lJO3pk="
								"schema: CUE":                   "9pf61uCRrJd4v+hEG8ep0Pj8I+oOaePL5uJnEOHWCbQ="
								"data: bryn (fixed)":            "RJVZLT5EsptHSAio54wtV9PO/NMGqmShmu390tpC05I="
								"data: alex (reminder)":         "ipTRt6XLv9fSTMUtHNi2gX/xHo5yE6CIXHm1vuIAT18="
								"data: bryn (reminder)":         "7rb4cVdrvXx1mzUTsq7bU9QDOUUqmvxLdnyvTIfUv+M="
								"data: charlie (reminder)":      "uQnph/gRJ2m5jhdCaRoZAY+HFFrVncM5nh4lqR6VmNk="
								"schema: CUE (reminder)":        "z9hsarZLHkIdak+XHLqX5BJYUW+yXfd8R+Yhr9SrNtU="
								"policy: CUE (too restrictive)": "8TdBX4lBZ1g0KmzaDufX7EVrQOhNKB807F4XOTfsYmo="
								"policy: CUE (correct)":         "VWsPLQ1CFw1XwgezK5aDqAhEYjTxOmJTnpHPJISzfcY="
								"schema.proto":                  "9ZvPbbjxTC4ehBoo36QAb3O4ektr4cJJFqVnyh8tDlY="
								"schema.json":                   "Oay08XUtI/lghxO+stvhdp6h7fqXkjTJjA6r8xE/+Qk="
								"policy.cue":                    "FvI4ERiLkzwPKnrlGwytvRRZYSm1lrhTyMoBHUSCJDM="
								"data.yml (broken)":             "lLju67IcOpoASfymO98cqiTe3W9sHmeoIdgBnBX4dYk="
								"data.yml (fixed)":              "vDu4kChJq1id3bjnKCIjUeLC/aiYPPRw3DgWaaMp0a8="
							}
							code: {
								constraints: "9HkIz1zEJsbZW6OTyA1Nei057wTIgX4ucTUkl/IAal0="
								definition:  "Eu33pbi8th2ZUs15sbd7Qi+ERQfCm4/frAqLfgaA/Hc="
							}
							multi_step: {
								hash:       "KQO22QTB1EBEDT32NT0H0VJHCM1NBPANARSEKIBSOFQV5K5MMT3G===="
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
