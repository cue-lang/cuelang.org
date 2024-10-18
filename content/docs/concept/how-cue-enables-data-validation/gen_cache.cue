package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "O0M1iywkrVBOZ0HBwvkMhUkTdfZun2SmDtLuu1UP1Ao="
								"data: bryn (broken)":           "GnsdhNXTCnRR826LzeQEHGrueotOEz5n+SgDp5Ot6jk="
								"data: charlie":                 "3rpbd7sSN/GfcfaflCIsVnamg4ghZ/RHUS/4aRzeZ+A="
								"schema: CUE":                   "shp4vfAMfDJF1aLptxqAzMR4PBVbA+pzMOryMI8gZdE="
								"data: bryn (fixed)":            "jR1+6V+24IIdis7XzRZzbzFMuMwbKKGwSSiN/pj1DPs="
								"data: alex (reminder)":         "YTYFKdJBD6DX1FwvAwqRKHePuwGMmphPyMZhW1h1v4Q="
								"data: bryn (reminder)":         "kbj7kgGbCrY4y9znmXDgLOxNx9ZPsRLtbuVr8SG8bho="
								"data: charlie (reminder)":      "/Jhqjw42OBvK/kHV8KndjXCMkSltuPvr4lFnFUXZ+QQ="
								"schema: CUE (reminder)":        "wk50BApiqeuFvX5ReY9FCVPodCA33VomJ4Eo0NdGxMA="
								"policy: CUE (too restrictive)": "h0uz3nLNJ4foDH+zGdnmTBUb7Ekb15aXLMcVK7Pq+ws="
								"policy: CUE (correct)":         "Ec1nq3FihmSIznjtDYqkLTSaRIgEtDXqIki3qsDxA8Q="
								"schema.proto":                  "RtPM5caTi/DbSvdpMzdET3ZrMM7jAjTW9HOKB1NoULM="
								"schema.json":                   "ihCUYHRTxWirJ6EmQ4oHQW4j/RGVssCf0b3o+FHrZ60="
								"policy.cue":                    "l6DSTyusxOFx/Ksm/ad5h2O3iVxXq8W+/RkN3fmlZlw="
								"data.yml (broken)":             "uDeANxx5SSWTP5e17RnWQMELLWBBARMXzZWgfXG4N+0="
								"data.yml (fixed)":              "2weWO4lh8nU/Imu3urvsUCYyedf+iM2ST+z1v+p4djk="
							}
							code: {
								constraints: "4qNYDvrNwCVkVAK9YYywbZloBog+v+g75Od7dw5stSI="
								definition:  "6dvM2e+PrA+ReI31ZarHpW98m7HFd7kW2oRLG3DzwOI="
							}
							multi_step: {
								hash:       "8S8NODH30JN62HM1FL551F8GPO2LUI5218O1NEPJD691SJTSDFD0===="
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
