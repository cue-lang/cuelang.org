package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "YPhIOzsOIICNjPaTtHK9TTqgK3nash85g6YmXPBAclA="
								"data: bryn (broken)":           "zwFNduR8WvOcbzwku2kDRTG9bsUyB/w3XPofgmkjF1k="
								"data: charlie":                 "3N8xS+MFIR6g2D/3Kn5yy9YjgCJXjAUqdxW5g1kBOqY="
								"schema: CUE":                   "TM0Zz0nIK+YVqkc36v1KlSbSvbWPxqCJ5Uir/RPLwNg="
								"data: bryn (fixed)":            "HXIJC93z+LE42RLV6Ov5IYEeh/iKrj/fjQv/N6akiZk="
								"data: alex (reminder)":         "O48dw1EGRtqdoVbNyGApL5CNzbLzB0Jp+ZXX+fgJv1Q="
								"data: bryn (reminder)":         "odcV/yfbg/eJKN92QIxd8s1iVtSEuDcMKl3zm+Oj7Lo="
								"data: charlie (reminder)":      "kwjg7Y1w2JwRifpknchXDEpVFxD/wFOvBxuWR1+U78o="
								"schema: CUE (reminder)":        "eeUjv7cKBZkiqbmD1Q9Zgc/by9jSHBhLyFQM5JFuPG0="
								"policy: CUE (too restrictive)": "BNfUKmjMRojcDqbjIVRUl7mCUe1/IiFxsDiB/A21jHQ="
								"policy: CUE (correct)":         "XWsLoVhnLl+dD3P4qFq4lQ2jM4pWE+KMnnc4rHDvu1M="
								"schema.proto":                  "nWkfscv4qjqZOfiXhSqk4Eu/hRNjIhQwBcEukBbIGBE="
								"schema.json":                   "k7GcWULw3fJ/LgbWdlLG1Sfbe7Aw67LIuB3ks7upab4="
								"policy.cue":                    "mKrzoo3mFfcpQ3EQAUeqCvqeT3l1RCn7JzbrENARQCI="
								"data.yml (broken)":             "otFzE5Lai1oIDa01lHqrSYJGMwIiIg7D/sNXQBQK/Gg="
								"data.yml (fixed)":              "9D7+2Xf8esYJ5CfGIF9+ROJgzOPz040RRz/RO5hUnBk="
							}
							code: {
								constraints: "wMLlAV4TWWRviA2Vyu9wvJqIhat3c7rA28GqwpAw18Y="
								definition:  "7dx6NVxoRuKuZBblK7DhVBjdZIrGOjL67AeZIwjezUE="
							}
							multi_step: {
								hash:       "IK5PTLH0J6PLAFPJ6TV7IHJDFR4G1NHL2742RBNM83UMRL2CDD50===="
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
