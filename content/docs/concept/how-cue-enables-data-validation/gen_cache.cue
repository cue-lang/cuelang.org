package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "pA73CANKKyD8mDLswvFH0IuhSFcbMVxDUTDeEHB3Lfk="
								"data: bryn (broken)":           "Ph6ZEx1xON0NcEN3UeivIdx7eKrAXU/w8dhdgRMmGEI="
								"data: charlie":                 "K0UsQXcO8F6wLDteMNKofVtAtHXmyso97/HO/oOD1Ug="
								"schema: CUE":                   "md/QEjQndyI5w5gd80ctEnZvaJfLxxR3lWi6Q7/3eWM="
								"data: bryn (fixed)":            "D5YuUqzkFs/PGc1xycdPSIz1Y9DesmjcrwyroUtBaOQ="
								"data: alex (reminder)":         "AdDyPXYfacKY91sM4EGPXwZogpMyi82QtoeYb0LCSLs="
								"data: bryn (reminder)":         "jJTjc1FId62skREf5+KY155wfjNSzOwkOKUZN0JMEc0="
								"data: charlie (reminder)":      "MCFeGW+Bn3KntMmmTbdPrAcdw9jkf3WCa0EVVU3Ul1A="
								"schema: CUE (reminder)":        "Z2J9lNdisMGVPaNIhhLJSjG+ajGPi4MraUkiH7xO+KI="
								"policy: CUE (too restrictive)": "yxdjeNIGpgOcYBnnNP3gnGPXMASkxcE5ytuUJ4+RnWA="
								"policy: CUE (correct)":         "yym9y7D0bdfACwxbE6cYeR3cfOR41N0L5fMI7gEHEHw="
								"schema.proto":                  "SGIrZWLqSofUmGBEJGl1eUQiDIMOrSfKklSVmkfY31M="
								"schema.json":                   "IAElhjHr4nad7CoEwtvUUNFe+qgznwJhqugInsYnKUs="
								"policy.cue":                    "QTUHE0j3MNarsJziQS1NJb4/rVb75+yOYpD822JS4ss="
								"data.yml (broken)":             "2ohmykgf98Jh60DItIPku3en45j4Pn3u+vJ/C5vePjQ="
								"data.yml (fixed)":              "+nNjerLY4GLXVBjYgkv8LGPwRUi+EQ8XluhG0TJhOsU="
							}
							code: {
								constraints: "bcX8lKVVefW2lUyVkid+Ww/E2yiTdvnIYBitDau8xEw="
								definition:  "T6YRRK+e6+ZIJo+l35zK/yZRNz/KwRSnMvGyKwBaSPY="
							}
							multi_step: {
								hash:       "R2GBEOK7231PIQO0K5O3S4MTJ04ECOATB132Q5U1KL9CA7LHGNU0===="
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
