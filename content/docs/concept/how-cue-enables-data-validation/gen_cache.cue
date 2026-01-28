package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "J5E75NIGgfkmVVkvd3lGqaDOjZoPPzN4QYGoK1AM6kE="
								"data: bryn (broken)":           "ppmoBCl82+x43FmR4w+SsnUwNIQ1jku0Tzef5T5I1WE="
								"data: charlie":                 "4qNESEF0GfOtPODF2Cutm+mSHzKylypzNEBwTPcZjKA="
								"schema: CUE":                   "0HEYoqLNBPrXXYQ30l88iUPz8ahCSeYEiRmkXJQtuUk="
								"data: bryn (fixed)":            "77NQI6ore1Bxoi4bVGvQfDMm16UNTv3PZ8FIIabZ/uE="
								"data: alex (reminder)":         "aDver20a/aUu9qoaRHK4Srfd+QjBMjXp9kUmsZ8qjU4="
								"data: bryn (reminder)":         "AuaJR7cNSSdFgei7e/0O8JEMWffEu8tyTRXhHv3YwUs="
								"data: charlie (reminder)":      "NlsXONFgfiFLCqs90FDbQsmI6rt6T7G+DkLoi7MH/tc="
								"schema: CUE (reminder)":        "I/8TWnuOxa4IxihsR9V23DtwFjCLdJrXeUSdibdhI2o="
								"policy: CUE (too restrictive)": "Fc8U6D5R6q0kJzFBC8mOVxWsnf6FKnXibpMNfw3WmUM="
								"policy: CUE (correct)":         "E+4mTT8vCAvvKUHyP8zxxzp59wwJoNMyiQvzDB692yc="
								"schema.proto":                  "tazRMN4lgu4ILI50CpR0EqMHVHkV9ot45sovx+BWORM="
								"schema.json":                   "bbr2t3bGsJd9ImMvkLw4wza24ZvKGPpwF75eb7cpeBM="
								"policy.cue":                    "6FclEjFO5w9eqyQmWatKMvdSiDTA55Do6RQtawFYwaA="
								"data.yml (broken)":             "41/iLs6bPy9U45RoXTKn3bcP3VoOYvrMwmsZDeeAqQ8="
								"data.yml (fixed)":              "RMUZUT8zebZFqMfh2by8vF+UUXGVJR/ksaezyht9jG0="
							}
							code: {
								constraints: "/KyOt5HNfuxB4xBtApHATEOx2fDYC8pr0JhWIJkgWa8="
								definition:  "rT9Djzacd0Yun1DrkGSa+PGcRzPPyYQ4hC4zM+4JHaU="
							}
							multi_step: {
								hash:       "ALDMKDTNJPUN3BP1N8K66Q4UUH3FSHPD598VNG7HFJE1B4I4L9JG===="
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
