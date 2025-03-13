package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "/JLb/66Ow79zBA9um1yZO0dAJAa6ckZxVYw91rO9bMM="
								"data: bryn (broken)":           "WoijecXEf2a4jjNVjAGA+nsOUq1rbTcoyKkFZdy1ZRw="
								"data: charlie":                 "Jd6hl4qBV1dT8hBl842oVapzI1fJ+6Jm90Xkz29L6Ms="
								"schema: CUE":                   "0iPCfV4A30VjeAqv4/ycygxZ+Fgtul1yz3uv7LlK+kU="
								"data: bryn (fixed)":            "016xWEOnESbTX1L/36YLJr3DWpzDh+DnmhxLInpxvZU="
								"data: alex (reminder)":         "oqOdViTlH+KA+Dvv0WI31oXOttO4B52xkOjF8Qaj4Xc="
								"data: bryn (reminder)":         "Fa88yrXDP6eSilEUZ7RIiQyI3hl9kQUUUaKBGhFwcM0="
								"data: charlie (reminder)":      "TJRgdG6AAvR2EPYZiWLv/vGvuASg/dXZwT4IYwxnJ2g="
								"schema: CUE (reminder)":        "O9NYaWBctnE5yCt99baPAdxnNPafQY8PTMpweQl4Nvo="
								"policy: CUE (too restrictive)": "RcnwHqOpQN7Ru6Gc2tgIN7w/sL6v1Hhcgf6JZYZRA/s="
								"policy: CUE (correct)":         "X74Cs+rIy10+BJ6K9BrnVntuT/TNZ9ICrvtcdLEat90="
								"schema.proto":                  "VSckjZ4hj+x/rdUMZNA/Ztm0/5tQmCF32n+783+goG0="
								"schema.json":                   "g6ONtHyRJXdzw5fYjPG4clS8H4yo2d7ZHVVBgz9uvf0="
								"policy.cue":                    "EaYQXjogsjHMcrgrspUGbZ8Sklc1pQ+oI2N1s95R/Zg="
								"data.yml (broken)":             "Yg/M5hkLuPQ65zn+uYqUzOazAWio3urDvDHfY3IbtAo="
								"data.yml (fixed)":              "J0yjHRtswozFlCd/dDjCvt6dfMy/KuEx1sLBXhMVPEU="
							}
							code: {
								constraints: "rcqFoylCH6u/wAu6NQXIpaDQ4ggBhx3AwrOwg77bHf4="
								definition:  "mvEjoqQqWmhLwmFD8ch6jRCzrtEb5unb91J2hZ2E7X0="
							}
							multi_step: {
								hash:       "QVQBFDFIC9NR0NCBGIQ9R1ASB34RDKD5Q5OQDVNICDQU670PGOI0===="
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
