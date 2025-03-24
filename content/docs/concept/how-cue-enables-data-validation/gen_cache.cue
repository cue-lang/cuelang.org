package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "yrxS6Fu5It2eIbKOoSumpEH2xDvTU17w6S406f2MpRU="
								"data: bryn (broken)":           "Kujvc7fGMfth+rDrjMTvqZf32dAXS+TdLke8YYaRG74="
								"data: charlie":                 "Ts1x8+dF08UV7tolrEaexOgZ3gHyM9JVZiCwMf6pkrc="
								"schema: CUE":                   "YJYYqc83zdYfnrMGdkpgux9lIqkM3YcfoMuxTYQ67Rk="
								"data: bryn (fixed)":            "Cq1/EuUepTQF6FrrUC6h8Cj5warWzVVzczR+8ZArIs4="
								"data: alex (reminder)":         "WIbIFr6aHePuo+xx0xR3Wvhl7q4Yk7Zdm+SOf6oTksk="
								"data: bryn (reminder)":         "MtqBkvsZkxCoEvx6WAwEwUcq+VO9tAVehtE1+CY/eDY="
								"data: charlie (reminder)":      "Rk1mpbtPHQggHQbMuLYpvfBccJZ/j85BIG9lgnKrYxA="
								"schema: CUE (reminder)":        "zBsJwViT5Ufx4XpF+9hDLBWDKS/V+4Q+2fnEHAm8WTM="
								"policy: CUE (too restrictive)": "+DtJimwJ/n/O4szLJJkAjtHpc29ckI4sv8X39igotVs="
								"policy: CUE (correct)":         "9fW3nXhJzPCdHxdMf62T5mfuWBMUmarEKkQV1iuAMMg="
								"schema.proto":                  "jUnnhcRcyNr4Sh5fQxY/LoCR62ilF0BgeEUIh3sI4lw="
								"schema.json":                   "K4bDm5aY7rCGBNcD0QA2RxiLD0WmzfRHDFs8RzyQn7g="
								"policy.cue":                    "kkdVEOHiFDX5n0jtovjRQ5pSlPLhjknpFC7snIm7j3o="
								"data.yml (broken)":             "MjLKuYZJSV9zvr2UCMj95jBLuJngrPofOkrSK4TAWkc="
								"data.yml (fixed)":              "xN7ogB94JT3lBpAadwByGHpKUBXkgVFeay2JyAGvLho="
							}
							code: {
								constraints: "v7SAKbHBleoqjuksKQVJPxHC9VWZBYLl8frGuzuXSbQ="
								definition:  "VxCq+78HXqOMz+bf2aVoNiLKxBl6zJ71btgfB6VoM8I="
							}
							multi_step: {
								hash:       "4JN210NGUN98IJNV8UGUGGHO46O7KLQCDPP1E422MRDMK03IF9DG===="
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
