package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "dkD1aotBsdhyrvEwc1CL5RRVftEzw1kocKCVzSqMR74="
								"data: bryn (broken)":           "wTn5rMOKSDt6ywXJHSp3hbMWT8GAYSv6dAOR/lDwJw0="
								"data: charlie":                 "QlgL/MeiIUWVidS35UA+9bI4WjMzg2382MBSB3VayuQ="
								"schema: CUE":                   "kxBJ2bn3bEwFK45njEqJZ0mMaNhFvAY1VQosliJd9Ok="
								"data: bryn (fixed)":            "jZwwhCzywe/q6vvXxP629Rver/DhkKbzqM7eSqo9Y0o="
								"data: alex (reminder)":         "V8yvarLbjudT/N/56WC78YaGOvLxcVpqZAqzrvtZZsk="
								"data: bryn (reminder)":         "XdBteeQFtsPXKzsmfjXtKGbb7zsYSfnkw475Vq73dZY="
								"data: charlie (reminder)":      "eqpZRhiG5stV5OSJDMmqH3xrAq7aBih1oJfYy6yTJGw="
								"schema: CUE (reminder)":        "RvForLy72vuJZn8AjjgtneS0Is6QdXOuT1tvRc0AeFc="
								"policy: CUE (too restrictive)": "BnId8E3eh3CWPUeATZmA/UM2XWY9ynDhds0QCwUVMRE="
								"policy: CUE (correct)":         "31uDOCGtBsrNKrSXT1hvjXRgkDBLHs+sxXTcZcaXslc="
								"schema.proto":                  "2IKaQBFY38g4cFSU7n17Wby+qGu94UlYJaTB+7CpQ2I="
								"schema.json":                   "RG42yPDy6yDrozvtwA1lVoEwYP8boh15AY/xjQPmJJM="
								"policy.cue":                    "UMPYudnW++uAKym2qbLfDpV1l0OgfnE9vUakf3Ex8eY="
								"data.yml (broken)":             "hHPkpVoW99zPph9nh7WvYcTck3W8AtaGQ52/w4q1N2U="
								"data.yml (fixed)":              "/3P+OZ2LIvtNDKpcmR0nUL8fD+WXwMfBxb0WJLNOOxU="
							}
							code: {
								constraints: "REPR9im3ZCuCReTQVJlphFnuewycoPtrFnIZN6rCzZI="
								definition:  "yMqSO2MwU1+hZ0RxS5gXtPMjicGNkYCze1/ocqmbYVc="
							}
							multi_step: {
								hash:       "1JS716RB0MRPKMPGPD7K2SAK2BR6884L4JQGQSBBDRQICGNQ7IG0===="
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
