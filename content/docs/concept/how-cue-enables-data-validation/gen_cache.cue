package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "aXMa74+NGzP2dvfv0AEHTebbAKqqz7Zi2A1neT11nqg="
								"data: bryn (broken)":           "uRDXI/AZa0Yod/u6DF2vAY/LpZKIAbw0EhgSuC6y4xc="
								"data: charlie":                 "GIF76Fe5HEwxUam7zGzbTSE7Yt0VDDmz1mOTtkzX4G8="
								"schema: CUE":                   "lu4moJseZnoYobeqW8K0q6t8ZZ6YdCMpD8Hhjchy9bc="
								"data: bryn (fixed)":            "87F+5uKRvbC5pH4MQM52wNvaSIXQeQU05dym7Hnula8="
								"data: alex (reminder)":         "JadS+oHuvRmehaI30O4H4qwnHUVpJv/9VPPOLJ08ePY="
								"data: bryn (reminder)":         "kKZnAvppgbbpuI58vBPqKYd/PfXVznPI0de3KEob9Nk="
								"data: charlie (reminder)":      "87d0QWeiHjb53ZN1OH2Nr4nFKiCpfss3sT51C2Jv4wc="
								"schema: CUE (reminder)":        "roSsXWw4dfJvzvKCexEANpZYsdT52b6punjyJvY4hHo="
								"policy: CUE (too restrictive)": "HpKTn7ETzhU6U45XWqRjvLHni0fE4slhnu4JNQpp/Uk="
								"policy: CUE (correct)":         "y/hB5NK8Ir675wwu6WRrqs72kFEgJz7fior/2arXTxE="
								"schema.proto":                  "Yau5UT3OvvurLHg/YJctm2g7XpIYHBEfDzZILcg1mtE="
								"schema.json":                   "fu+Pu0HeW/z7Xo4u6Qs3Sgzl1XCefBiZJkCJVjeYHXg="
								"policy.cue":                    "MeXQlcl5551BXfZ4TPZ6zsmR09w5yVPiezUAXIN0SK4="
								"data.yml (broken)":             "/oukiY9jXRKOGjBN69NrREO0+RxpXz7DQZSrCOCfC44="
								"data.yml (fixed)":              "AT4AqANEDmJLd6+JRjRVnB62yU6z7dRSq7uP4T1RoUY="
							}
							code: {
								constraints: "Z6fwIwTGOyRCpi5YXElt6KQ8QUMQGK+rnlTZCxmK/IE="
								definition:  "kGMHu1Pxi8GE4kclk5lFYHr1HX4EeIwkdv56YjzFfUM="
							}
							multi_step: {
								hash:       "IPK9D78BOA3QDVVP4FKDC0B42TC6MC9MK0E2K7FUG1KT25191G60===="
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
