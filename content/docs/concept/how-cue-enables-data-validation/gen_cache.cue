package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "zOG5V5CDKOAPeYr3T2vTCdfCG6ZeKAk8rWjc4zUT8mE="
								"data: bryn (broken)":           "GIlsZUBkt/zdH8NIHM+bB4BlUzlMqAW6/e0KL1fbiK4="
								"data: charlie":                 "qsLyrfY+Fp9E1WRCfbM/NgCNlvM/LuRyuq5ntsE9+u4="
								"schema: CUE":                   "owwyUnV2k/Dg4kswqDgG59G2seLD0Xx4oEGszJsSthk="
								"data: bryn (fixed)":            "go9pMgbitQl/XbkmIWIFcDaaSNJHsM18Sd/VJOh1TCw="
								"data: alex (reminder)":         "3LSGtGvlhfV6aPLTCf4IWX80dsfP9N9c0sfm8laayZ8="
								"data: bryn (reminder)":         "U+AvaTYtqmqk3SVpk0kiLER4CbbBqx2jtNSD6fSPviM="
								"data: charlie (reminder)":      "Iqer6WecQ7LE+842KHav77ZNeukHoV47U1nBmvVBLzU="
								"schema: CUE (reminder)":        "LCpR36GBDnqkYLA+4BMuDArjtyOM3nHWnM1w9W2HyUM="
								"policy: CUE (too restrictive)": "5dqvqaF2P7mjRagFXoXOFeosGvmNG7iSiE8mSBZNsRA="
								"policy: CUE (correct)":         "T4UKIxeHe2xiXDUGObmwnkGxVCrr8839GOiNkeCtapc="
								"schema.proto":                  "3sbXkAiYrdjc6H+kvrjs0qaYtWW2fFZ+19IF05mKFqE="
								"schema.json":                   "tXNVtUnrHZRmO5cMW2cBJe6/0uUsiluNgLF2/gOMph4="
								"policy.cue":                    "Nwv3U6KNX0hoPgE8kBqTT0/CXZpHWaOdsmLynx+/8FI="
								"data.yml (broken)":             "v/oA36Cmp9A5uytPFnzWCpbDyxiyrJQrBfzttwhvKMU="
								"data.yml (fixed)":              "F/IrOsRB4CpJmW5nvgt0Jhs4VfBS9isvn+FU4vABcVs="
							}
							code: {
								constraints: "2mR7+bLEAtJ9RwQzIdHNLvx2yl9fkO9bS41bv3KcnZc="
								definition:  "mAyob5ME7ubvsM2WIhvhVqQLy9qcSYJi3r7bSrEZmv4="
							}
							multi_step: {
								hash:       "T9FJUA6JRIM1QOV4PRO7D42R8BGUI9EOFFS5DE7PP4FUD1KONB6G===="
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
