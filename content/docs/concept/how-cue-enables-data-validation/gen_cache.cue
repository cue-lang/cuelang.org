package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "3XahB/uBsLcz6ETQmf2GLo6uiJ1uxK5rCDYq+uFrcj8="
								"data: bryn (broken)":           "0wlPlDVOWPew1hB+FwWH5Ih3yoCGcM3IH55anxJafOU="
								"data: charlie":                 "U4K74kKOORRnFxDyzMuhxcwjdS+3FMDFOqDKto5uBuU="
								"schema: CUE":                   "UXZwkWkICvXEiV2W7hTRpDoFLsIcwR4xg5AJI8gSn7o="
								"data: bryn (fixed)":            "PI2D5v/t2gP1Z7FWWx6Myeg/zhkNfMmcogWst/bFLHw="
								"data: alex (reminder)":         "6l0ALMuYP2p9BHrjdKmbi8o8sx2Aoi6sH89j/lV8CAs="
								"data: bryn (reminder)":         "eGDYcMeebs6rVm4a1g9SemJrQKe0A2hnEWFs1dVAvJc="
								"data: charlie (reminder)":      "kYSbtUE2Z06uKXugYTNcNqIN0o/ZkwgjzACgOqBWty0="
								"schema: CUE (reminder)":        "pnAvvA+Qzisa48s+CAM5kFSfZ8rH/GeA2dJmTM13mA0="
								"policy: CUE (too restrictive)": "Wt662GuMgxwOAmK2QxBnffY2LBFteunL+F8Nf9VhZTs="
								"policy: CUE (correct)":         "giXuiLnTdSMTQKz40CWk0DX7PFqNHdrr4iFHwixS2hU="
								"schema.proto":                  "8AR1XhJpqbItaSY1KKKBPoIrV8omr1+RKu2jl7c/IMM="
								"schema.json":                   "QdrynfTQF1ct89njPD1RhOKpZQGU5GG8aEt/1Dbfpvc="
								"policy.cue":                    "Q7jFFTGtr9z7frhk4wIcBlDihxHSG7OOjSDAtpbqmjU="
								"data.yml (broken)":             "wVzpNliBXgipesEOJtg29VDbkiP999aAIP2P7m5CJEo="
								"data.yml (fixed)":              "QEDl5nFYvaz4CA1l0RXRMwxjY06dd4GWMipOi+Zacz4="
							}
							code: {
								constraints: "55ctaJi2Auroh9yxTwe/PnEy2qpsuCaOlQR/KczvUkk="
								definition:  "o9RehvkqakOhmdDisO/2SRVrDv3uD6DPLsBTACBH4Iw="
							}
							multi_step: {
								hash:       "HO972KV2ET440BGNIHLA2SI8TRLDM5E2BTI9GFK2H8JQ8F447DLG===="
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
