package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "OoE2kn2CbknY7YPP2NrRK5CYejJ3m53M7eABsafSyBc="
								"data: bryn (broken)":           "z+SuZzi1imTCbJF2l0UHmnvumTRbXmRMGPy4iV9BcQY="
								"data: charlie":                 "QhwZ9+NyMmZYrYDzjYMM87FY7QhHC/lhUeZp8nwSEqc="
								"schema: CUE":                   "d+iSGID0o4x+2yrXEBT3aRnM8gRis4loI3r7YwyL2Qg="
								"data: bryn (fixed)":            "TbrGuy7Tk2HSBCP/vfzJgKd/pKayd8KahE4NULY3fdU="
								"data: alex (reminder)":         "2TTxRz4y6S5KLiFKOrz3VfcbpRmJMUy7kPGl6HnSaI4="
								"data: bryn (reminder)":         "bL6Ut/v9BIjawUJhJ8f8LNvD5Oa1UovBL/eyNnheN6M="
								"data: charlie (reminder)":      "WaFqYZlM8XymQE9OdF7ItICohsdKaxb0cTU4sM031BY="
								"schema: CUE (reminder)":        "nfnYcjl7szrFu2LIfGxaKdScs2vgRThxLUFf+np/xKs="
								"policy: CUE (too restrictive)": "/elY0nPGbyue0oAZzfEucShYA5GNh3QJTJWBHTsIL5w="
								"policy: CUE (correct)":         "+DiSIoRDNf9GBDEmveoDVyzySO2MMzhg41UxbKUXMr8="
								"schema.proto":                  "aIaXRMAqXZX0wEIu6/bvnl1JZjJX8vFe5XAGKlzqpKE="
								"schema.json":                   "lumZ620/xwZtm1xbFLD8uCyR73nvO+frZ0pUuHuo0NY="
								"policy.cue":                    "j2sj++CvL/clOJFO2C9ue0HJX7JvZsBPWI6T5Tg2YUA="
								"data.yml (broken)":             "6pZyenb1Bb3kTHDdD3gAokr7hIDPdgUSK8QfO1gjQzk="
								"data.yml (fixed)":              "7ZNFXX/qx2VIPGPfEuxdaHns/lfp7FKPqd77wmGdjrc="
							}
							code: {
								constraints: "ZaDu4QV3gCKOBrLV3OunGhpSjJXo5xTT4uVsf/Ts9GY="
								definition:  "WvxZrP7lyPDil1QCcikAmCyJtawsGCO46CCqiDZ8BZ4="
							}
							multi_step: {
								hash:       "PUM8U99STNPEP00LT7RRO9ATPUEQ21NSEBTORDT072TA0294SATG===="
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
