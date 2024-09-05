package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "4qSzMbg0gPvmTZm6h3WWajYZqgSBVud7eFX9g8ucZu4="
								"data: bryn (broken)":           "LuxC601Os/ax6SaxJ/7Xo4QU/Pr4cixmXpiJ2rN1aVo="
								"data: charlie":                 "F1UqbZEYfFpsMjR0acWqiMy6zUWpSq9Kv36vX4h4BfQ="
								"schema: CUE":                   "1iRt4Jhc8A985JuarZejKkEDa+DbkvztCVBFnww801U="
								"data: bryn (fixed)":            "CuBEWFzxyLJoJdMvBnfzQumYjBOgdt8vG54bRYY2/Co="
								"data: alex (reminder)":         "x8bUUgYXa/IrGBvETAZJMAl/+49W5h1LCohWYphpH34="
								"data: bryn (reminder)":         "BBlrwO5adYKInIR/lflCifc0iJun8P1JvAs/YpgUSOQ="
								"data: charlie (reminder)":      "wSqR/jP79/+dEXSFXDmUIevNTcpLBtyF8qR7xmJnXz0="
								"schema: CUE (reminder)":        "bhcp3N5XiRSfo4NKRyKvSVL4ZAgKql/mGyYqHu/lYW0="
								"policy: CUE (too restrictive)": "/PE79khFUqMboRGHjEicxEZZpZ3kBRZe5zLj/51dAtw="
								"policy: CUE (correct)":         "0sr93NNRkoqoXFnDAqoBsxfKwrHGnMP1GsAalebcjn4="
								"schema.proto":                  "0wGOOIVd6vKWos4C02nwmA1mJjW1tTjErrrltglfxMQ="
								"schema.json":                   "jrpaATDHEvnpLI90S7fVZv2u3dOHcd1aQTqMIfE2nTE="
								"policy.cue":                    "9B5ChVW+GWh+MmPn8JHzBMwQN6VnrtVVw0Qb5/xEcUo="
								"data.yml (broken)":             "25UNZA1l2V1XLxaCdA1cHOhxbKhwAPas759OpcSzZiU="
								"data.yml (fixed)":              "nt/GL17q17XfXdFNXb/AYk4mmW1yDNFQgSQna9bb0/0="
							}
							code: {
								constraints: "+3vzprAAtAckk9X+W5JId0ro2PhQ4VhamCNXOvG5Lp4="
								definition:  "5YoAuO0ZhzlK8ZwePsjP1YC5x5ZuO41nKhT1Geovwpw="
							}
							multi_step: {
								hash:       "I1RHB0KU0DL06AT152APIMD9JU9FNNCOVLC3G4MEFN8C90BCBOFG===="
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
