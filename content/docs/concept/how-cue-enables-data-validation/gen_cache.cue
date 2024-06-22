package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "kYJruPg/9thzTkPGFpkSDr79X1GQXTXOVjDPviG414g="
								"data: bryn (broken)":           "/zoEc7qpLXIdfuquKg/nSR8iGeH5SuheG0KlNLbu7YA="
								"data: charlie":                 "SIUN9Ousd0uWoNmp1+N1lROWNGUV0mOK6mmbVp598fc="
								"schema: CUE":                   "OxNnzkkJGp8lFNBzCjcNVIgy38iiJDukGuPrAj/P8CE="
								"data: bryn (fixed)":            "fInO35lbAExR26f8AeSw3fMhyf0sHwGBUfxQ5s9EnMM="
								"data: alex (reminder)":         "+5rdJXrhiRPdF1J5FLyL5TZ63tjaF622hkK+hO/JxyM="
								"data: bryn (reminder)":         "6sfe+fprDs3CrctcGZl38IEcK7JaXo37IxfAyPIpXb4="
								"data: charlie (reminder)":      "YDCqjqlovLtZ03rUihfje+TmT5GcBtn0yGAVnJQ/MKs="
								"schema: CUE (reminder)":        "xqa1phGFtcTWuXlWFsLPqFCDcel7wAMjNBey9+Yr6rU="
								"policy: CUE (too restrictive)": "Nrb0UTke+QsfqkHGjrtjX8XAESp2CMJjxuKoo4agltE="
								"policy: CUE (correct)":         "++cHb5306azkmnXABi18W1fWxnaqxjh5dXXpsjHXH8M="
								"schema.proto":                  "Km+dy6WsQE3uwlVTBndh19hiJzXyHUNjb5j6dOR0FJI="
								"schema.json":                   "sS4RSoGmHtdDnmSciAm7sRFJYrkEiPvQ1Amg/k/vc/I="
								"policy.cue":                    "MSWNUW1YQejMh3KSrYchmZm1CldKom/E14gSFLWfQxw="
								"data.yml (broken)":             "YvzHBqiMQvoUCMvb842A4ncv1KOedq8xQHMTmUB/IqI="
								"data.yml (fixed)":              "AOq5UTkm+q5Ye2K9Kx55Q8e549oc3PN4ItKaWNZ//kY="
							}
							code: {
								constraints: "DDxDYdWmhvwZJRjd/OMKQr2P7T2kQ6evRwNC//967iE="
								definition:  "35b3CaanMaLhJHkuUZsIY/dwEYsVK1niBmgNKBqoUns="
							}
							multi_step: {
								hash:       "852PRV6HAGA2NHOK6LTBUAQD7S4UO6QLTLLG0PIKI547VRK1I0BG===="
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
