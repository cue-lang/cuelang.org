package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "t0Njrhskchxq3AnSmHT28gs2ds/i7xxqEyDw42vlNtw="
								"data: bryn (broken)":           "Qoyf0OQz2Vdc1BN9qq58QTK+uBhBzQA9diVHsanO04k="
								"data: charlie":                 "l1A8VgmIiEUAeKkFwNGHPH+Ta7BfxEi1L0owLQF0EWw="
								"schema: CUE":                   "JrljKg/l9bg+iBWNvFlp1SaW1ZD9Yf5FBimWS4Tb7wg="
								"data: bryn (fixed)":            "0UHzITOAEKfEg1Jkr9kNwYFKWnhkgOVEt51kbPwAvAA="
								"data: alex (reminder)":         "glsoRb5IYp7q8TBRUK3k+KnhmPX3OqRL3wbJFyQNS+Y="
								"data: bryn (reminder)":         "SQBA21hQl31kvr5CeGplwZ8FfAlATPKxM95ILP1T+l0="
								"data: charlie (reminder)":      "chze4Dj90DfJKkusObKrNrq8PLp24n91KDYW9jH8HwQ="
								"schema: CUE (reminder)":        "N8z0oL0QAHU4/BjdQJoroF4kyWdDtqJM9boGWwjMdOw="
								"policy: CUE (too restrictive)": "mxvkpji+DBtFhQu5PT5Liqq+Qh9sh+ENv71nKiSbSnY="
								"policy: CUE (correct)":         "1ig0SjQGhG0/7AFKo/yCfkUb+OUsTJ/8TgqW1J5xK5Q="
								"schema.proto":                  "7qdnsfCW/aXpEhHl2K8mh0f5WKp/fUiRSwvmhs855P0="
								"schema.json":                   "8Ikp+8eDWmauZQdft53RIN09c5nsVrEmXUQ6siJxuuI="
								"policy.cue":                    "6fn6wAO+yXEm/Hjkjw7+GayhTwJz6VQ1ZWpcKE8KmGo="
								"data.yml (broken)":             "boALIZmAo5yjZZ6kZuwrLpsiZEERO63g5kIGu/jbaL0="
								"data.yml (fixed)":              "Kf+bWsW1WKD/Olpn27iXfFiItsB/e47Aht6nQBqiSVM="
							}
							code: {
								constraints: "WP9AI+uhZDDBLkFPWkZ7zYghZGu+av4fhRG7lvnIhJA="
								definition:  "P3n7BCadNE2ZitO794iOseVOSlE8Vbum3I0yOsUCNHs="
							}
							multi_step: {
								hash:       "M7Q6PNTB5K1P23V83LJQ5T94SJDETM365E3NKVN582MQG3BIE93G===="
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
