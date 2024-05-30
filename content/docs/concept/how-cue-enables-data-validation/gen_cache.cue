package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "AAeo0n4v7UID7S658xC7Sw3ZmRq2XLb198/jzA+rvig="
								"data: bryn (broken)":           "WRvU2ILQshdYsoHihUZDMTMrCcx/KUyADmlug3j8QLU="
								"data: charlie":                 "fHjo3LhpV6mDFXLcWDCHQs7CXtp4Yn7fPU3WCAFi1eo="
								"schema: CUE":                   "tEhNS3CS1vCi3AxGcYbMaEegJPY/SPs8/SSrOuNGXKA="
								"data: bryn (fixed)":            "A7yySuxESyeYoD50PrWRXvnuPQBYwv9TDFGT6axrpGI="
								"data: alex (reminder)":         "HOzAMN/NYC+qACo/lHjTsbY+GDjen95m36KYqgfNwcI="
								"data: bryn (reminder)":         "4z46Lgm5wljs1evKYu8es/pGUollZ1KzGv6mHzseolA="
								"data: charlie (reminder)":      "feo288bBp8hrFn9463dYn/3xf6+XkKyMuneDpBw/yoI="
								"schema: CUE (reminder)":        "UlTdR1k82Oij6y29tolLt4c/4GTLhejmKOzWpJZXbJ0="
								"policy: CUE (too restrictive)": "BW6nht8nWIvtotjJYCcEUJ1CjLBcDjuv59D8z5vdXDk="
								"policy: CUE (correct)":         "yEj6EOc5+/KliATuz7EdJ7y6L9CnVjGISyyYXg10yMY="
								"schema.proto":                  "1xd40FnTAgTZiC8fR2HRF35o2JnK/I9ENHtaXbbqtU8="
								"schema.json":                   "HvdCawFHBdcUFlJiimS9L/axXiMHoUfb4v2CPDcmBNQ="
								"policy.cue":                    "8SvNjPOy8y/GQEDKHhR5XhrdOWPn3tO7okdhYZrFqOw="
								"data.yml (broken)":             "9C8pQ/PDg0pFX5MTJ9EypgbODdi3erQJNLK8DwcRXHU="
								"data.yml (fixed)":              "SCTpK+VWrh9acdqC+iwv5dpNe+i5algBZKpaCRCTbp0="
							}
							code: {
								constraints: "ymEW6Qh4d65DReYodXnJymURYVrzbNwkDJtUviBheMk="
								definition:  "KYLJ9dusjlzOZpo5dkkUWn4YduOW6Q2RmD81pITM9HQ="
							}
							multi_step: {
								hash:       "L4U4OSQOISOTE8FOBP662DUGC30DLJN4UA219DEIFMKM70JQ0H10===="
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
