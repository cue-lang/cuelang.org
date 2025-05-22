package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "8qSOeRhZwrKQVK5NiLIYlx8eVST2w7bXPNUkWMxCJRY="
								"data: bryn (broken)":           "C+yGSZeKlLn2oPutR5uRbW5nEovPRG2+iPkJb9ZP+Qs="
								"data: charlie":                 "jSFTep5YM9v46EUtvhRoUcKrkGqsPyIrWu1FHil88JA="
								"schema: CUE":                   "wv0tUdFk0hYz1a/pJ5jgj5PvJ1dQpoMt8rTWMPtWkOg="
								"data: bryn (fixed)":            "E6eb+Bzr7PGNkmpltsMxXomj8gLL+ZS8KyxRlE4P17g="
								"data: alex (reminder)":         "057VVBavX+HMcYi1/IY+ORLOwlA6qdsE8kq0yCHG3BM="
								"data: bryn (reminder)":         "GdACruykp43S47s8BPGz1Imp8bNQB4wmp6DjXKGOZag="
								"data: charlie (reminder)":      "Xu1E5SfWPbhg6Albj/ztPjAYzK/rLr+pPsNez566spI="
								"schema: CUE (reminder)":        "OjaimtXv/qNSjyKmH7Sxg5U18Hkqt9I5cG7umkA2oa0="
								"policy: CUE (too restrictive)": "zsh45v1LjSNKRvu8WR6TG/Xf0oaZQ+no2tlfPIrSVyc="
								"policy: CUE (correct)":         "gkZunkHVOVWUa3llQNkpTVISYcCutYREW+UF+8gRx/8="
								"schema.proto":                  "ctIQueT0OU6b2ZnoUZjoViDetHEzwm5Ml2PrADxtOpE="
								"schema.json":                   "EYgZLiJ4ogSPUtcuMZb9Q4sofmlnPHBG0MgXpFpXHp0="
								"policy.cue":                    "25VwsfIXioyBod+PVH9ExNBjlwgbEMTXNrm0iFANnSE="
								"data.yml (broken)":             "OGnoN9bezFCOFf1QXTsH8hi8EBqh17EpVCVJfhrSnnk="
								"data.yml (fixed)":              "DeWZho4dGrGLV/ZvOSqsJ8t5M5KI7U5HkSzY0aM+6p8="
							}
							code: {
								constraints: "VonVnAoLKJBJUfT9+A8qN6vI83CIiYK4S/evpSWqt+o="
								definition:  "/fXMg5ni+fRH5N2CUXJP/O8ScplUrkc++J0HxzEOfJ4="
							}
							multi_step: {
								hash:       "VA0T7C9GAF41JFB1CT79PM7PPHLP8RSKPLATJEFFJDCMDEDBVMF0===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
