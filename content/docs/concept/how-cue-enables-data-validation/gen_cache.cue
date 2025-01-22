package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "f3Tka7Jsfd1kzsVbAOJ4M1MnFoeZVhM6aq/3MIzmEOg="
								"data: bryn (broken)":           "cfLGNYWKRdIAbYPBU0Cy+ZL7cJpGoGn+3+wS58QqkSM="
								"data: charlie":                 "gbax19hdo5fJ2G9IwJ9S1gxpfQ/XlzMqlKawY8b2zAU="
								"schema: CUE":                   "1RJpM74LShK0van6XaWAjiovBAypK0Y3Z8vnuTSYgdk="
								"data: bryn (fixed)":            "7rLmoErAyFYO8kNF+ciQ0G/ABXN+KBKoNVpmXEVVn9U="
								"data: alex (reminder)":         "Ktj3CM0uVOIltL+EMyXT7kjujhz8VVQEs5sFqyF2vkE="
								"data: bryn (reminder)":         "Qd8BLVkW7KU1w8ZP5TepHrPz7qBdXJ1Kq1w26kDbmmo="
								"data: charlie (reminder)":      "ulc7lIzjZGx2SqusJHx9eIUPtKDpGmJYkbw/0h1K2SU="
								"schema: CUE (reminder)":        "OjxA9s6HcTNy/uHDt3Jsb/OCgCfRwmXHb+2QNZXC74A="
								"policy: CUE (too restrictive)": "X6LpbuIsNI5bVp/AZuTKat90FD4e7aGxWfudGm5Cb60="
								"policy: CUE (correct)":         "XUzM+wWRwsQjccwlCm+ikuHSYuERX3oGkKq+Tdf8Q7A="
								"schema.proto":                  "8Zb45daoyUAQJzVLtQtrPZgnti3SwaBSloitpuIDLig="
								"schema.json":                   "f/yPdS6c4jOOXhEZpCu8HVpFyiUIUthMbMN+e19MArM="
								"policy.cue":                    "/dkbFd38zS5yeHjuIK7GxoueGa8po5TG7yEJ83aaOAU="
								"data.yml (broken)":             "jy0znCfSuL/ZGrvHcMh0Gjqr3r0U/AKKQj3xJGLMIhM="
								"data.yml (fixed)":              "DmnmLVogqi6d/sbaqn5j/+9TyHMVIdskZkpxbkxWNIA="
							}
							code: {
								constraints: "abkTLbX7L0TqRcpGpBZNdqG76JF2t6QoXYEt+to5/Y8="
								definition:  "UhvCcRXKb8PIIdMDKGIo7jTym6f2KFxrdnOpprjWQ/I="
							}
							multi_step: {
								hash:       "BT7QFTMTDI6LM5QQN3BMVN6OFIPFAEMM4Q8C4V2BS5RI042KMHLG===="
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
