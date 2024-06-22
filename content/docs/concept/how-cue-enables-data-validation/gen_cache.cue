package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "YHQbjV4dKRf86JzQC8+kDeu8UHZP8p9FDa5CoI1I5Zs="
								"data: bryn (broken)":           "XtexIpbf9TWkyunh9b0U6Wco1I0rGN6OlRMvIqmH+fw="
								"data: charlie":                 "ncK+V29fuWc7pWL5c9sGxUCPBYTWtYo1y3osvPjieHg="
								"schema: CUE":                   "XSn9yuDhdTRTqmGFGVYlC61qe5yv6mEqtSDG2mnipik="
								"data: bryn (fixed)":            "Cjvb1C+YjXW8Q0CNxaFO1FvskHZoAZSL/4Vh/PL9XfA="
								"data: alex (reminder)":         "3dloxi3sHr1Ct3d1KuvPK0iznib3I8ZTDNGq8JDyk6k="
								"data: bryn (reminder)":         "8r4535m3BLITVd+owIrOzemrK7HvVwTgvLxIdEWD4vs="
								"data: charlie (reminder)":      "g6X48AYXRivP3pSw41/NVHSSXwLic5FbuMGPSrJVVwc="
								"schema: CUE (reminder)":        "QZptDV0G0QoA4xaKW+c44N6NxrAKEiNcoQ58fxNSDkI="
								"policy: CUE (too restrictive)": "NLeX8VYFoLIZvdRXTsyQU59qW9dSQWOYTLO4yW4JWmA="
								"policy: CUE (correct)":         "PYaLGu+0JnQUC7gYcc+/hqJNyLikEZ7k8TlLFGjTJOo="
								"schema.proto":                  "+oyqbfxZCzr0mPWQrLmgpPFRCHrQcIluBa7N7iLj5BM="
								"schema.json":                   "gl//5aaB9zAEKaWDi5tbLXS5I23Abh/FhZLId7RmP0A="
								"policy.cue":                    "Icj0Pk7y0RykoGfRMCSigTR0fbvKIsKS3LFK35ZcbNI="
								"data.yml (broken)":             "p4uwNqKe2oDEw6okDSLk/2EDTBpzavwUwBQEErCW/W8="
								"data.yml (fixed)":              "EDsiXLR3M6v/LmnJ9WS13ZTd3pKZ6XnAKa+M6aduHXI="
							}
							code: {
								constraints: "IKGEZPQj5gLy8zDkdFBRjE+qhc0upsJyzJpT1HQLQNI="
								definition:  "Qjk3FZK7NjMwEYVxR248oSmnR8jXRGPyUjIWDO99o7Y="
							}
							multi_step: {
								hash:       "IA0AHSEEVP62TFL2KC4GS0OU74BTO6QU4HK39K0LFV0HR23DTT3G===="
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
