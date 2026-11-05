package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "L/zZyMA8Sf4ZDyQiRpbKa+tG3nPsgmMjLP4pEuCphHI="
								"data: bryn (broken)":           "dNmgGHZkXyfJMbY9yqH8cTSR0Br4wb6rnPtepZud8r0="
								"data: charlie":                 "rNOufMIfio0WiEjLCq0mbE6nD1Tk+biqEYSK5t0IWNY="
								"schema: CUE":                   "guVHSdPWxqQOxfDOwiBM1WArAMQ/wxNCqN4MLrSH7Vs="
								"data: bryn (fixed)":            "at0sWReaplGrjPwiZ7ORiDVJMhIBXhayP3yLxXrjsZc="
								"data: alex (reminder)":         "gf/OarxdMMUZ5fQk/DcFfD6HyIeEzIx90PoRNuXdN7w="
								"data: bryn (reminder)":         "zgxbNXG+au0fgWl3wZybe8kmmWz2rVNMYJzdrsdHVmI="
								"data: charlie (reminder)":      "rTro19IFgit+/sixJ6pEkaQQeStJYTA/6PXaGCg1SH8="
								"schema: CUE (reminder)":        "INe8uk2q1liB/OlmEVuarIELUkrw/h1S0L/UpRUYy5E="
								"policy: CUE (too restrictive)": "rhepex80L56p3pCCsqN1xVVAybQq4zzdnpc9F9tPZdw="
								"policy: CUE (correct)":         "iC710EFAntj7BX+mgAi0MSScwXcLRKxvYTnpF8BhepQ="
								"schema.proto":                  "A/Y05Q+wU5zi8tUBeZ9uI/SN25fb40OnGYXeq9JW6Co="
								"schema.json":                   "xXdZ+fO3GkXQbY85JNrDpTxqUOCjo6Iw40eF72/ACfw="
								"policy.cue":                    "8TlHUgUu8QN/lOoaX4/AsmuRmLeRQPx/oKCqbjxU4uA="
								"data.yml (broken)":             "fpD8/sT1w/xA1O2wxd0kQUmW25mD8q7qGgxSWK2vqfM="
								"data.yml (fixed)":              "b+0kedHc/4ev/lMBrl5kTXgBQJmGZl7BZoNLdnOBsOM="
							}
							code: {
								constraints: "KHGx9lXLM4NkXnExH+DPcKPC2jFCnwfry/yyP7NOe7o="
								definition:  "9W2rMKfIluEERxYdPYBfAJGJUhyEzuC6Kfswxv0LwqY="
							}
							multi_step: {
								hash:       "GOS4LSS8JPHFG8OJ848EGIBVQ53G430C7AQ6LTTCSCM30LT7A2D0===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
