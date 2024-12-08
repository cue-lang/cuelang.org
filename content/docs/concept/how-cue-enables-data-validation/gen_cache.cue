package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "NTtK2eZjrXxUb7T2G8TupmYd7lsLlhoEbEKxOWLgGe8="
								"data: bryn (broken)":           "rhJ6nk/pGHaoPYFxWSXKGgh29LzKGeXq737mcI10Cio="
								"data: charlie":                 "9QM/AlQFNZQ3aoVXWZpZD2zB5NPbzvKt7z3Fqa6eh+4="
								"schema: CUE":                   "CR9ef7KrfKaiSyVAQVghrzQfIgYEaTnpOlPGZZaCF4w="
								"data: bryn (fixed)":            "1jsYwqU1a94PDwuTrypPEPpxT09JfJdekK5v9eeswyk="
								"data: alex (reminder)":         "bqvp1cx/OD98u1jAYeoZ3Z1qPzwwSOJOXdcD+fVIrvY="
								"data: bryn (reminder)":         "FJgTbc3ujxLxlVf6177syBJ22be1IGgzfZJsYePa1LE="
								"data: charlie (reminder)":      "HbrkKkf+V53kiGq+SpYiXQbH1baa+e8zBfSB/Z3ugrE="
								"schema: CUE (reminder)":        "pj9VSPM58LFaIsbBgVgLGBOwFO7gzcJio2XgoMk5/eg="
								"policy: CUE (too restrictive)": "xi3Um9LlTVlQrvtgaTtcPJtQ4EdUCSO396e6epRDcz0="
								"policy: CUE (correct)":         "NZUuBx007wZonlhMW1JBibUNDmvxm6w/ltezpSzRPW0="
								"schema.proto":                  "h8lIfxzP6uqpQ/92ERcGfNTB+oGh7OF6bPn7HfiBiaE="
								"schema.json":                   "UEzUkrvfA1z8lCrm0lZd3b1bLD7srkKi1RrSTG8/MUw="
								"policy.cue":                    "cvCNj7jevPizLTiJISwL9xBs5HwmOJZ+0tXzl4UmNA0="
								"data.yml (broken)":             "2rO4f9pN26IbVhv42NH61Fd+5hAU+C9fydGXF2Fp02E="
								"data.yml (fixed)":              "YOwA0MAAf2EbPYuBqazT5U2nLtdLzIHJzG1g9O5aRZ4="
							}
							code: {
								constraints: "smx2q2ti0F//Dv96/tU55nAC32jJkmX8mK4zJrBbHpY="
								definition:  "AsLnCd8Ugt02lD/QwxTyVhqKbn/uVDz0RgPCPuJEEY0="
							}
							multi_step: {
								hash:       "4EE275457SUUFBQFIKUM9GBI86BU8APEGOBT7AVBACQ1Q4VFSRBG===="
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
