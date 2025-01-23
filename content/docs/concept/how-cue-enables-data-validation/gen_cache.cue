package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mGNQjS94YssF8OGeDlrbcI1lP7dTDj+JaWubLyzBtGo="
								"data: bryn (broken)":           "TXhVOEgIfjLR2GAIR6ALPiaJg/7ePT38YBucsWKrgP0="
								"data: charlie":                 "Cl0WbQrTl5OkfNv30umrkUTP9a8ZV0pYcXsAvAzXBdM="
								"schema: CUE":                   "DX06j+7P0YLZA+/dk5EIp45V714f/02e8kMFzY79RMM="
								"data: bryn (fixed)":            "4RMdAkfjfrnky1lzjKfRMsMIScBe/jMnRTdKRlsMiXQ="
								"data: alex (reminder)":         "r2x5ZljzQZv+j4Ti2O7qSgEU/Y1Gw4bVBzAD0cJuqqM="
								"data: bryn (reminder)":         "QDE6zGltb581Wt1HZCACdWHxnjBfTKK3gF/J9kYxHdo="
								"data: charlie (reminder)":      "pHsitq7k5V6obJui/8iZcwTbOalz6VVY9VaTKeBAXtE="
								"schema: CUE (reminder)":        "j0hr6aKPF4hkimT7rcVlbtZMHv/wsttv3/LWY7+LYDk="
								"policy: CUE (too restrictive)": "cA8acXFqhvYUdpVz32Ntf2V4hL3rSgN4ePztjVjg4h4="
								"policy: CUE (correct)":         "0sBCRS9RO05rUgJ7IT34cr5k2J+n9K/vIQRb9q1FlJ4="
								"schema.proto":                  "NwIgivBvjFhWMPcsc0DgdEFQiPvlLbPxCQnzQsvtV2g="
								"schema.json":                   "uXluvbN6HeS5ibJ/Ir5+MqfUkx6DakY9u7F20F622/w="
								"policy.cue":                    "FHj5Zkw6VH8ZFZMY0Fhp5BjFpbVif+gN6FHtv2DRM94="
								"data.yml (broken)":             "cZsrE0BPs42/VEYyMztCLNj5R4JdptomsJojEEV6cXk="
								"data.yml (fixed)":              "cQV1jhIHtsRIff9Zc131StbvqJB3kBU7TV6MWvN3GAw="
							}
							code: {
								constraints: "ZCd/V5bjXuzRcBRpMjLrtNuUUmb5a8DOjQAe2bfMlSA="
								definition:  "Ombr7puzbbqNzwewSAJLZ6dFsh5e75Pa7arhQyVXXA8="
							}
							multi_step: {
								hash:       "GPTB7QRMPCULN9AN4ON9TV06QNLKSQGK94T2QJLBR9UIPP7J2S3G===="
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
