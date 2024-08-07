package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "GDWG2Qww0VXfUNmdTxZNu1QMSdY1Kkd1xlHCvubx7QA="
								"data: bryn (broken)":           "+VkgB3ivrCvviB2yMVpN31/zFL+RfUG6hZNMSgFxH4Y="
								"data: charlie":                 "/ovTsCtqlvq3nb61lmr5Cfh7VhslwuaNGYOi7sUEixg="
								"schema: CUE":                   "EHFxnfKUkyVmvW6DmR/s+iVjNreIr0A8gWkEqRjZGMg="
								"data: bryn (fixed)":            "GRHFZQfokKH98xB9hsEiVJ1bvkRsHcfRrUpJDyjJXzA="
								"data: alex (reminder)":         "rVeyHPPheK5gG9KEC3JJ8XR/k7+UX+EAnWyzjCBPvPc="
								"data: bryn (reminder)":         "GNbtUu7uaryfZK0+zLn1z3nIDzSYUdQAeAiDrhaEjv8="
								"data: charlie (reminder)":      "k4I6nrr4IbA7BFzJylK4BOFckpBIjSUINgf5+3jmQAs="
								"schema: CUE (reminder)":        "JpaInsXPeAE9qGfe4YcbCfcMe7GwGMg/DYq9JJgC1v0="
								"policy: CUE (too restrictive)": "cgWozD2DPjm6yYD+zxofVoNs7wbzVZvhhSLmhWxjIoA="
								"policy: CUE (correct)":         "Uu/d19byga/aBv3Ndd1pHxfyeM1BZjmYbhtC4s7v3wM="
								"schema.proto":                  "U6fri+8Q4jBuDScqZ2TLZ1gL7nt7FPL5dndq+H1zi+g="
								"schema.json":                   "CjJwW9qS3oGQbKXDa96YGfj4DioNtQLT6x5CJ1fZaEc="
								"policy.cue":                    "Xv3AOqpmjqACWlOomCJxnIt+zSXzRkf7ZxsCRl8iCco="
								"data.yml (broken)":             "09tce44gGO2SqXEprdcAbU1TF2kY4WJGbAc/1zITKFc="
								"data.yml (fixed)":              "co9DAFpBFpjUBLWuVo+jmIWySE5saQk5qpxIeyqiTOU="
							}
							code: {
								constraints: "MKA58NH3gGEo2Y7fcB1tuoDnnzVSdFZsnFg9ofO9YEM="
								definition:  "IHI4Rb2C0EG9sq1DPhV6pqgTzE+BSaMBDGtaSgxT4ok="
							}
							multi_step: {
								hash:       "6ML0T4BE6AV2V6SAPOVV5ABB7LC2DA8GI9P5NGIL1G5KSDST1V4G===="
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
