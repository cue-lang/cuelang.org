package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Zu17ZMApOhRGM2UgihOhBiiEANWLwbgkE8mgxirU+NI="
								"data: bryn (broken)":           "3YwwAqLiMsOBrgzYu4wZ6xcwf6m4KleUPK4FhpplGzI="
								"data: charlie":                 "Vj2ERHHBP9FjOhiBWuvYyVsvdZbeGIIJA3QzPnrwLck="
								"schema: CUE":                   "Z0ytvKhSABYu/VUD+xjl7SnwS82vndzDNu0c5tNGpJU="
								"data: bryn (fixed)":            "HCt9Gks7sQXOrjf7zjnr96xumeTm1NxCTYpP90yyTcM="
								"data: alex (reminder)":         "/+D0pfRMPE8DyR1+RudmS/Ks+8gsBdj8O/MPsSgKGy0="
								"data: bryn (reminder)":         "WDHcWLnBN4L5qfqRU9Uf4J3G0b8Nx3/i5od8LkrlbEs="
								"data: charlie (reminder)":      "wuetjJWhokjQOolB2nMiMJxnqFOTvUAl+pWSNraL1dg="
								"schema: CUE (reminder)":        "YpxuJEw7vOjVKT/y4lR1JHoEBQKqhKGBD67YwVb4ECY="
								"policy: CUE (too restrictive)": "u+DQaXHwbMXRXhcqOzWxevFqK8gJHnHmykQYTchq/Es="
								"policy: CUE (correct)":         "c9nB7aVU6T/uEJgA5iw/Y6Lg1UtsE4eaqdoryHm31jU="
								"schema.proto":                  "3mU43SE0h7u9ksC2bj0LbINrAv4PyISgf4XNT3cymNY="
								"schema.json":                   "x4rfWvLyXdfOYE3fGM+FjwpxyJFdoBuIVTWpDvcoLY0="
								"policy.cue":                    "2YTPsUTV70TfJqA+rzi4/9JoE03EQCQCPvvNdRmDsiU="
								"data.yml (broken)":             "ANXc/W4h+UFQYI/Ngz/aE7Th8BL+E8qLFKyzsMkfOq0="
								"data.yml (fixed)":              "H1FzfHldhb7BlBllv3uoy/efF/HvCpnTxU7XozzUtHs="
							}
							code: {
								constraints: "kEnEf1eDs70iZdVMfSR49qqNyyvpwte6NVJMT2JfHSQ="
								definition:  "VIrUBAaYdNweEZuarBE05EktePqIlK0piVdB249QMNo="
							}
							multi_step: {
								hash:       "9MLPBTCBFCUIDGMV24CT761VFML11ST792BBMOVO086ACEQR8GMG===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
