package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "0HJ+7RY+IyRYrrfK94ZUFS1wnlexlvGOSdh7X9b840E="
								"data: bryn (broken)":           "7lhkNxUfXRdKQcWxlvUZYO3aI2Y4Qd9Vlw2SmDyFqgM="
								"data: charlie":                 "uV4dAUWPgEf3kqhxgJTppGpBgkmAjy6Om0AUZtFLPVk="
								"schema: CUE":                   "yHQ5WbEw+Hy/M5EO1Z07pOJOwe2OM2iJPONE0GTdReM="
								"data: bryn (fixed)":            "WVHCD26D4eRaHqcUDeTs0UwZp5K0J2J9z9QD0yXC3Vc="
								"data: alex (reminder)":         "dZ4W2Fj2gj+zcxIoiNDEV5RmNABwM/KrLQX//rNyBTc="
								"data: bryn (reminder)":         "r3EmcWLim5BZbSfUbO8XwxxptYdou1NYw5ZxsMooG3E="
								"data: charlie (reminder)":      "WEFeb1NGo9gMuZ3YL3XiMlwmtV4cmXIeNVqZUsF7Tcc="
								"schema: CUE (reminder)":        "4L9gkekxZAck+CferHTWtQ+kT1v4VNwkJrMTtlGxmJA="
								"policy: CUE (too restrictive)": "Jx439pt95VEKcNKw4Z4nZip75AGaUft691ePOk+an0s="
								"policy: CUE (correct)":         "pqjIlG0YL4s1yTsy5u9LyrvB/y+av/0Vjfi6/Vwcvb8="
								"schema.proto":                  "cEOQeTjYSUZ+KCtgZb2Xi7yNCr+0adq4/I3ZDAev4pA="
								"schema.json":                   "vjxxNLC7/DcYdpTJfdlUnZ6Bss13alRRhfIvejF2pWI="
								"policy.cue":                    "gdBclAxf8xFrSirRbI6k2T2fmmoCDOxC+dQn/1iXW1M="
								"data.yml (broken)":             "yL5x9oTezKdNa59Byerl/k3GwJMJYYX8AwKHKfre0BA="
								"data.yml (fixed)":              "pBchPq6VW9GmItT9P3nyPvQnj8ONUnSWkdu2dEvDBqI="
							}
							code: {
								constraints: "mkD215+5M4JbfpMGVeDga9/5mZKclVoZEhJX8sesmOM="
								definition:  "fd5j/up+5qe2l++Uf9A3LQNA9VY4rFba8foki/HrplU="
							}
							multi_step: {
								hash:       "29OLLIM472V8CCCR7OE4E9N8H54AMO88032145IO1RRMBH919L5G===="
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
