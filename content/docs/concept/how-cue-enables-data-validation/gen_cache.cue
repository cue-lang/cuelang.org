package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Tb15thSD6UhKhlWyJMdK/SOkdor/J/NwCX3R1JV9+PQ="
								"data: bryn (broken)":           "aB6FC1F/IrAceX7hwDg9cIaL1NYa6PPeZLxDUpCHBrQ="
								"data: charlie":                 "8+mvw3nyZz6cy6XGRb0pNz6oLkhJWdJuysqBsp6/Qis="
								"schema: CUE":                   "sfNIarPOPIJdFkUfGgNRBDrQbU9wdlUJQ4+iriOJzHY="
								"data: bryn (fixed)":            "XxD46usdYcR4mxVQm7F/hZvhi3rm9p/4R299fNp8kfA="
								"data: alex (reminder)":         "A6E3LaS7hgTta0RbAr/9ef31vkp/zZoySmxj+I+GQV8="
								"data: bryn (reminder)":         "Y7vdJXobVAdtHQPd5lGX7Gd/iHJGaAIdbXJxIyi9J2s="
								"data: charlie (reminder)":      "F5JKZ1Zzdg7oYqH7f5xZ2EcHsVBvrAPjurSBuEPKPCQ="
								"schema: CUE (reminder)":        "N2Epqnu6LdCNhM+PVeVgWLHbRpfK69sabXSYqUu02jU="
								"policy: CUE (too restrictive)": "He0CcGn77jHtfMZdxG5nwMa9AOh5HfULtmYfxO8JliE="
								"policy: CUE (correct)":         "B7ynkIMzcLzufinir55uMTUekQdiqToVkXUhNCFWh38="
								"schema.proto":                  "pV0sT9IxlI19VXEwPDez5li30z4VQ+ROcVb39Z1L7ks="
								"schema.json":                   "F/VYoyEKRBLj3yReSKozaKnx3b+lQmoLkphCpjmJhqE="
								"policy.cue":                    "9MejsB8JvrFKv7Vw8cEc5q4XObL5q4NM2ahnQM55K8A="
								"data.yml (broken)":             "qGcA0h2mCsyW3LMvkDlAGx7pcJKKFH5M1gO8czOoC94="
								"data.yml (fixed)":              "4hO1S7uN52/LicqbzruDpcthoSlC0v6Az4mMLZczjQ0="
							}
							code: {
								constraints: "YBw4WTEK0Bf/2wwmkwHA3JexCCEIweua3S4U1f2QDak="
								definition:  "/5kuAkbjWeBaRNt6i6n83UhGWwdshmHYGbYSkax5ecQ="
							}
							multi_step: {
								hash:       "DAI2MBA0D1ERRI5V0T78UR23MTU932OR6VK1FVPVN1UE8FLKRFC0===="
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
