package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "fMZsyZdKCvvsnzIcmEmcyRne5gGrD3nMnH4ztPJdT9Q="
								"data: bryn (broken)":           "x2h9PM+EkESjStRm/oZv9061ipURiLrT7dLIT0aUXVc="
								"data: charlie":                 "z/POuPZQxvyagORTVVokp7zaiu0k/EU8kkDtC0KTJiI="
								"schema: CUE":                   "qVaZ8L88YQpE6LXURCgSwTnI9qx6BdXW8X5BkB3xSYM="
								"data: bryn (fixed)":            "gp2YXPDQb0CY+o2WYiX3z2Pgnhl1e5QtoVFt/1Kb0Nw="
								"data: alex (reminder)":         "8jC5hlR/6UmRiYZdsslajEJ8fGtao86hNRTBp1E/NME="
								"data: bryn (reminder)":         "yLTn1zn8F6Vw+PnxPvzu4rjmvST6pwSresm05pfwAT4="
								"data: charlie (reminder)":      "hdey/AksaoTekuf12aobQ/j3cdU1+ZXvdfgqlX9+ASI="
								"schema: CUE (reminder)":        "sIz0RoPRHKZ5LLdTt8YQRLk+iqF7s2PXHCBuAtdZ6As="
								"policy: CUE (too restrictive)": "ZrRW0aLhg7btg8GuJprVw/8OSKrvEPNpLnylhu/86gI="
								"policy: CUE (correct)":         "oHXGMLT5oOdjzZ6VCLlWjzp1HV7o7fIQJlJ+awlenGw="
								"schema.proto":                  "7q9qclT8XWBMl4Sa+6y3tezObxn2zLO7ygKUZH57gYo="
								"schema.json":                   "ydqKVzrNIbt7+BvetG2r4j8myrWXIB9PWA/6witRIlg="
								"policy.cue":                    "4uedX6XwOvwv79biaUhXvLeBG/ZNIFfk839nzDrID1g="
								"data.yml (broken)":             "k1PVhX4sZMU4kzFgfMROeNoMPAe3nl2QCfL+PbIl+h8="
								"data.yml (fixed)":              "xpImIAj5ZZ37L6ZU+XwRF/Xy1J2NlP2dnxe8H5sXgGE="
							}
							code: {
								constraints: "WIqFABZ/8u0BH6UHtJ0YJK67kJ6kqUBxR1bny1788XI="
								definition:  "RHGneUwGd6L4mXHTlH5UTVfF96u/VwolkzvIGK/6cmM="
							}
							multi_step: {
								hash:       "NEQ5C50GITPHJOFT5TU131CFQ1K21PPI0ACF3O9JQI2TA56D88M0===="
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
