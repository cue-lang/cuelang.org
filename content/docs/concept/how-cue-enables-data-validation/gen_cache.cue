package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "MvZTD9JJ2WSDff6I6hs3teMqAxCKSc6TNS7/FLqvslY="
								"data: bryn (broken)":           "ocvqIi6lYGB2DxoHPx75LdG0v3mNpIObDlfoCtMrJtQ="
								"data: charlie":                 "NN68N6Il3nY9Hloayk8ephgQshHYik/hFKe955hORMs="
								"schema: CUE":                   "uto4ZAYMUMY1TaOrnbG4y96CJDuuXuQ0I7GYoCHOa/A="
								"data: bryn (fixed)":            "AO/JGVsFlXAQvKjmDFr4pgteSw8H6QZ+fUyX/Rtgj9Y="
								"data: alex (reminder)":         "pv63WYjmsGGPfwpSBUog4axzReu8jJ6sqDWZl/2vQAQ="
								"data: bryn (reminder)":         "yKIoT0eTUjEwd7jauccOHslL5Pm3SOKj0r9AnTEzanc="
								"data: charlie (reminder)":      "CaRTNiGJhVAmbF1MUxKCmaogiAc0gQQH/kWe4G+ek3Y="
								"schema: CUE (reminder)":        "gK1WWwPIR70mqGExPOsZz1hyu3tFeUGBWpGcEQlL0V0="
								"policy: CUE (too restrictive)": "AW4GnolccqfQVWaCUZhf+GovNkCHr++IIDOlFStF/Lw="
								"policy: CUE (correct)":         "NMflnJ+4clbJr0P50MFrvuPRQLbrLJREKri9Q74JJ/k="
								"schema.proto":                  "4b5I5dx2Iw6jQJQwor7NDUd/+hoHVyk6Ch1Koj63nYM="
								"schema.json":                   "xjk3+orFs3OgkI5WNjFLzGQlxXgQhbXDD0wJvh+rdoc="
								"policy.cue":                    "N0BXwG/vKx5qtVHbkXV+nk85PTePDP+oFJmNji9AvoI="
								"data.yml (broken)":             "m4hdOXiES1XUk20OWTUq07MNfUesBJ2o6YRFLuYXLSI="
								"data.yml (fixed)":              "HCzBYgZ/P9FNkRdpZ+aG6OID3tCpmY9N26oGvgFFoGc="
							}
							code: {
								constraints: "dOAFBjzkQ9Hz8cjhG5MEy1YZvOgh5IUYYpZIDF6E+iM="
								definition:  "fTycbZPKwIuVnYhuEBchhM/DKLe3/cxNndhGo6W1WYs="
							}
							multi_step: {
								hash:       "5B8G7ROIJ9G5711THJR9Q9V32B3QJ6H3VPEAP2IQ7TT7D9DRSLB0===="
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
