package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "v30p2n9n4KPEWwVTlnbPxj6GOWxyCcFtFVJR+ylJ9E4="
								"data: bryn (broken)":           "ZTl5F2Vjny4+V86b6jnRXNoQpEaPghdCkdsCMpDvoAE="
								"data: charlie":                 "hkK3yj60OIJL/Rj/kgbZeQon2bZGlz38l05KMlU0yG0="
								"schema: CUE":                   "A7pMLng+1HVbinSLOzxnyRp6T4qD1d7mj5waEEjaepk="
								"data: bryn (fixed)":            "Gpd4vh2zj9qf9FecPnnklLZhsKw5X2pP55BVz/pvdYs="
								"data: alex (reminder)":         "QsORQD36pZyTrVAutByxfmKVnJ4YOHUe0mDNo+il55U="
								"data: bryn (reminder)":         "V2FmBxMbpH4lB2yZ8iKB81GUihTOigojBOFVbNglWYo="
								"data: charlie (reminder)":      "miJuMu1CWxawLBDdmGe7I8WoYKTdXyD2lWNCZb5+s5A="
								"schema: CUE (reminder)":        "bAg/qf2HCqX7FOnJzzo8GTKB1tVIdrvYF8cL0lI7Xz0="
								"policy: CUE (too restrictive)": "1x5nYV3ybxjdM2+u87tbTAUs/kCu7Osx/nDi4hKaOnE="
								"policy: CUE (correct)":         "VTF6uxFjy2rPptodoHWIJUYonkbwU2akBJ44UTUEHg4="
								"schema.proto":                  "dNLSNRKpbNfGGd0VZnlWalZUdwAK0dLUf5eaRI/8ld0="
								"schema.json":                   "tQCWH3EK+zgcwwD+ysZxZ9TlmYei5x97gBZFb5z4L/s="
								"policy.cue":                    "FO3Htuh6AzzeA1dJ1awcuCRbVuJnpWQ+bPVsOEN+GvE="
								"data.yml (broken)":             "QtJkLt4lIeQSQ8ARzQkcfDzW6qmhCv/NkLhXhfUAYmo="
								"data.yml (fixed)":              "qkedELHyfXU1aof2p9E+T6+JsMS+o5jGAKvM7UADvrU="
							}
							code: {
								constraints: "+Kn/8i/LZfDmp4fK4C7HcSjPZQfRXrsrL78cEV/JkAg="
								definition:  "Q9aNwuQeYFH11rB+WYlnFkRl1LscRAhnGBYwe62YEwc="
							}
							multi_step: {
								hash:       "FFTS5G1M5T562M64LIT4H328UT1AM6PC4MFCU9BG7F1LVL7LI3Q0===="
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

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
