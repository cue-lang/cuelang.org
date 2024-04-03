package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Ht4Ie0AHVIpgsIUlM6cg5XzGQs48Z3TUk25vO+RZXxE="
								"data: bryn (broken)":           "2OHd6NLq3Rk8CRJ7x+Qdh0fjxuukKjXrcWroVwdk/aM="
								"data: charlie":                 "qmpATp5jekkhgcHlFAjxuer9+mftbxNQXpSjaY/u8rU="
								"schema: CUE":                   "MhYDQc/+HYMZFVowUL4g3+tkdAlXOXBrSbCMQGqrGqU="
								"data: bryn (fixed)":            "SnBkMYq8bAjhu8tpw50zvjzKkL/2I34xxdDEppFWdoQ="
								"data: alex (reminder)":         "OHTekJYoXIyTt5G1bdRDjtoo/24UKVxj6/EURiv3+wk="
								"data: bryn (reminder)":         "zGVOAz4i+Uc2Ot4Z9lfU16/1eovIeYDvvU+H8CVw6jM="
								"data: charlie (reminder)":      "wgZcV5y1Yp0S6dK9xg+7g1AxNxSO5X+A0u/ZnHyEdN4="
								"schema: CUE (reminder)":        "PsOhlcDsptYmJThBSBhCx4mWXHywEB+PPGa6sNcpVMw="
								"policy: CUE (too restrictive)": "Iap7ntJdML0PmF0sGTYQjDGxX1jC1pfXNDq4EeJ6KBA="
								"policy: CUE (correct)":         "IJZacLfBGa5Q9PPczd9Reew6AP+mcWy4fx6iJZqVg4M="
								"schema.proto":                  "xyQ1Lnq/xY8gipGM6V2YAkzzuKQ0e8C+/jx1d3Fsskk="
								"schema.json":                   "kpCh/Bu7U0MTpM+rrg+Bx58BFYDEToosJXAZT/Ek9VY="
								"policy.cue":                    "21HVm1/ULAndIo7HzGZjlvJxAw/HSCk+0WKUmi/Sw3s="
								"data.yml (broken)":             "TrkoaUDrIM2nS6qnNynfSpbbc0hY21c2mb0qkdAJMho="
								"data.yml (fixed)":              "ao7xbAGGqMs58Dph6RSLtrHXWAM8Tu9ji8Om2aIXz7g="
							}
							code: {
								constraints: "rjMSG9aQlGZn9QrMTsW2r1Sr6bpDaFWeFPQfM5mSCak="
								definition:  "2pKZyXaAooMX7FgFQGCNSZcB4fto9vNIob43W7Bah3E="
							}
							multi_step: {
								hash:       "9HSVS1J1OU69QH6J94V8LKTEJ455BBATBL40M8UFQ4UO2D3V1PVG===="
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
