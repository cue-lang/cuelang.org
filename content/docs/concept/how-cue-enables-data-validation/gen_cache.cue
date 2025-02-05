package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "29daT3KZMdmwBLTn2ClGerDymvLYSIxkWjmZeL2cfMo="
								"data: bryn (broken)":           "IBSMZk4Mlyw2rYs4wV9AF3mTGmYXUxQcONJkockD5ao="
								"data: charlie":                 "CnzMVKXIdECs3LhM3l/nMSk8R5VQg4pQDgd0vN0CgmM="
								"schema: CUE":                   "IxCr/XLBRnXbhiyVlCQ8gloEZo8GpVlkJoVY+Q+JheM="
								"data: bryn (fixed)":            "RqV6ZjmZrhCSKP8iP/QTK5mzZJ0q9sKmCJ4frv4tA6A="
								"data: alex (reminder)":         "cFE0Cwa+2H/JMyXibHDCggQiBfHh8hoVOAybb0gRFgc="
								"data: bryn (reminder)":         "FQc3ONC2e/LfB2aPdaLfbQlt82X8OhV/Q1H+c5nJUrI="
								"data: charlie (reminder)":      "v1wDjhebuSmiowoWwetfp1z6tqxZp/Y0xj9apmGR4bo="
								"schema: CUE (reminder)":        "mBP56JuGsR3SK+DrEJ5Qm+m2TWNQ0jpkFN1TuCrN09U="
								"policy: CUE (too restrictive)": "eQf1ijHddH13srTZ4mmcJX+0Vc3tEBZAj7WFACez4nA="
								"policy: CUE (correct)":         "2idRDqkNzhiR/5lRpPV68x8l9wHWoj4hmiWroE8Xqpw="
								"schema.proto":                  "3vf5ZJPSv7wwTel9HqvMYlZTJHqvXHvthswG9Wux/fM="
								"schema.json":                   "VJuzOjCQK2o9+PpgZT6wPlTS43mLEqmvWc0QBh57MEU="
								"policy.cue":                    "I7Ggz0CHCojC7ptZ9skb4uedwiDigAzH/mZ/6yyqs9Y="
								"data.yml (broken)":             "8GrMw3wbXPdR15QQBt/S6nOb6nUyr0WqQ059IfdT1+U="
								"data.yml (fixed)":              "fmOtl3yeK8JWJ7p2aUWkeur8GEy4k5eY2M0iagXLppo="
							}
							code: {
								constraints: "zaEycxkJmMXMcwJqQKmsQlZF15FWekQXC6dpep7Jz7M="
								definition:  "G9W9l/nsxrndpN0OgXrDePTMhpsNSyRXiWGGQnLVyfk="
							}
							multi_step: {
								hash:       "MEGS344KM6P9ARLBRLLE59FD55OK4DPELIMDLT2R2AED2O7NSE5G===="
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
