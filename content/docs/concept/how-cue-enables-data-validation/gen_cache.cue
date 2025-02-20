package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "fDtVqRPapj9lpgwMZgLnJvHJ9+e7Ng90P68yF925zew="
								"data: bryn (broken)":           "mzQU65fH0NiVFOCf+UrVY1B9Y10CnU+n1LATyRZ2WMo="
								"data: charlie":                 "nc9Di6MehQP1IDpEckQOpW794sS1DnBwD7Nz2MINrqA="
								"schema: CUE":                   "A/s9HK/d5vq4WudtrHI+KAHAT2M3MIb5tIgZfOfAR/U="
								"data: bryn (fixed)":            "VEKQGlqwF2cJYCl0IJlFK+ZlPylwHs4MMJvKgTBHGI8="
								"data: alex (reminder)":         "qWq0g06jVtnf54NYenXlcE66QCNtJzgh1u4zfquI/DQ="
								"data: bryn (reminder)":         "2pjJN/ORIwHVXfZkImpFZ2SVqINb25vDADfzrJCo2yE="
								"data: charlie (reminder)":      "BZuzPbg/3afXmvGS4PDEyMrHfWtaBKUjA07obvaiVqc="
								"schema: CUE (reminder)":        "25OFGXSoqcEuPqdu4XiJESOYIWgqO7GD4wdypLtEaXE="
								"policy: CUE (too restrictive)": "u/UnzXswRNL43WPiXg5+B6w6+JV7sXbFruCCLtMDBIg="
								"policy: CUE (correct)":         "q94SKMr+KnmYT3R07zR7I7bC3e2MRRFK9tvLEWpng5g="
								"schema.proto":                  "N0rmbNzSRdRcYZE9gEgC1NUA20zAKbnIyF0mnlz446c="
								"schema.json":                   "4/Jmezy4nP70uazj2zFnHj6m5iDtzDl3JtaPps5ZOKs="
								"policy.cue":                    "E0aG+zDx57srHT+t06NlKp3sB6vGqStpID2JA+BnxV4="
								"data.yml (broken)":             "rlmcSTlO0MLS0EuGKRWbzN/EPUgnno4VA6V9KVgv544="
								"data.yml (fixed)":              "BOdyjvSuEoKosN5TmYkz4jwGuwoXxBa0TgHiAbOaucs="
							}
							code: {
								constraints: "w/X2vHEuSdDz8aZrINfyE9GcJ94yyI0qgtov/ldsmwk="
								definition:  "AR6jKTWvLqm6BOFD7KheexzumPSRCSf27NE1wW1Bp7o="
							}
							multi_step: {
								hash:       "H9O1779GSC413FDS4I04SNA5CQ95G3OBTD3SAGGSTP9R256S8SB0===="
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
