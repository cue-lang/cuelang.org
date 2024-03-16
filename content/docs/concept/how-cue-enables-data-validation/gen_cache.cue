package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "7DKFpUEvaDr63WConhnswXqbrXvCqQhWxTtUrEeQPoU="
								"data: bryn (broken)":           "Kf4x7bitl3GxqoDHhsNWxypQ9NK0anXmAbaiRuR/+Ck="
								"data: charlie":                 "xJ4xHsAZkiTTtlZ7X9gtBng4krHdEREONF+uB7T5eJc="
								"schema: CUE":                   "Ep/ijKSmACiLu94AT/OxlNMBCLBEPUy0RgTdrCI0rf0="
								"data: bryn (fixed)":            "VBuBq65EQP+iBvEVApfDAJUBG5J+y/v4xo9WwlIc1ZM="
								"data: alex (reminder)":         "6f9i4oIcI5tSM15kTGiOZ9L7G8cekTCIEp68h5jknrc="
								"data: bryn (reminder)":         "BCKTE2L27Qpnv7TjtqJg3FL5rKWq2p6g3GXS0VDDhlU="
								"data: charlie (reminder)":      "LhP6CEgqM9+R9fxLEaZmbGqW9BqIa3pgZ+3QxPhBE+Q="
								"schema: CUE (reminder)":        "DQTZeCVeAZPgQB4Lm0uY15QU14ayJtGAqmUyebKcYKI="
								"policy: CUE (too restrictive)": "lH/oKkLmiIdKzokV63k8NyOKgN+xEjUZlO+R/McjB4E="
								"policy: CUE (correct)":         "6GdV6ipSJxbwelHTnrW1vxe31VgpZUxbzI6cooD//Hk="
								"schema.proto":                  "SGN+7A0+jrZtvVg8RSVGbqsvOhsLATNdJtzH6xK6AkI="
								"schema.json":                   "WoGP4V/KXGNvGgvP9K93h9rJev6rwU1OLCqGqKh4NPs="
								"policy.cue":                    "RIu9ZrXUw9Uv5eZ6P2P2Nv8AiRTwyfewtXmncR1rfpA="
								"data.yml (broken)":             "FYVlGsRbHvijVpMHExGwXO/F1245R7uQJ2s+4THdDac="
								"data.yml (fixed)":              "uMzEPPAgUVCvTPrQmYx7ud1uJqPFD37F18Okx7u/ZAQ="
							}
							code: {
								constraints: "Yswv633c9cK9MUl1fVAqWtgV5N/G521ZjY27V1sNdAo="
								definition:  "JPYOL+ln41uWC8eEbUGwVRNl9ZWDwXwsGqbkBLyGggA="
							}
							multi_step: {
								hash:       "4DD4BKJJSNHPSFOE2HFJ20S922JIINCQ1QH8DCTR6HFVPOUSMTF0===="
								scriptHash: "RN67I70D239QM6H3VGAOVAJ0TE0TU4E0VRE9P511LGBLBQKT396G===="
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
