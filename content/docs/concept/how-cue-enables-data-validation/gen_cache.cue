package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "a9VUJFjiFmWDT6CLBne72iAgb7S/wxPbOqStnaSW4lM="
								"data: bryn (broken)":           "31W8QtGTfOx6+aKMZLolpwkCk3f3kTY+IcuHn1If3Is="
								"data: charlie":                 "/Xgigg3RUwJCJPHB0PlwSK/gJLCwH+yqRtWbGEbGbDk="
								"schema: CUE":                   "E9Rc6tVZJ/+UdMnbdgLSqnXMQQTX8Z7BxtDBNqewm1U="
								"data: bryn (fixed)":            "oKEVBSzYJZkN/oJehoF/zm35CRax+9pZ4RdYytsHQe8="
								"data: alex (reminder)":         "cdEhIygwnq646+CQ/OFd9vGAuUVc/FkVmiFz1nSNsSc="
								"data: bryn (reminder)":         "hFa8SZuW7KjemmVuGk2a5KEt8gFf8SjUAhHMCEyCEms="
								"data: charlie (reminder)":      "6WizgEmUHoB5WUpSedMNwZEMiy2YIx6j2wYsdn8S+Gk="
								"schema: CUE (reminder)":        "PouU0rBkByNlepAok4DG2bnpaWMdbWmQrUr2wyHc7Ls="
								"policy: CUE (too restrictive)": "xpBDj9JP9ujNEy92EQYFKDynlrmvfLXP+aTba7k19jo="
								"policy: CUE (correct)":         "tsxoetj5dk0P+Q04qkCBNVk9RCe+GYS9gPjyvEdHzgM="
								"schema.proto":                  "xDR1M2HH/bbCOOWZy0n70lZ993JIs3dz/gBkmveYtx8="
								"schema.json":                   "/UgyFDdAIzn2gROqFpjjFHQotLRV4t1f8GvmGDhDyDY="
								"policy.cue":                    "+9RCLqYJfaw6tQSTH+ebMELXhTAmP3Q0r9B5DHoCaFk="
								"data.yml (broken)":             "iYcIEh71YMg9nz51/+ooAbLKyicggYZAbbL12arpfDM="
								"data.yml (fixed)":              "RfMUdI4+L4TiKE40GkWwCH2M23jk02RJnDEArOSiRLM="
							}
							code: {
								constraints: "ZFoxlldsuuhd4xaFJme8FDk9uEhzn/cy+3Bc3sOJ4Jw="
								definition:  "RA0zrPi1q1SzzDTEsgbUIk+icntmsFltIaMy2+PL3ik="
							}
							multi_step: {
								hash:       "QEE8896SMP0VUQVDF7B160RS2NVPUSNO0R5UGLI8N9TJK31PQ48G===="
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
