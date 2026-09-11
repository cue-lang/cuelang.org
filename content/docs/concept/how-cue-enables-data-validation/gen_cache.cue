package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "XO5+iTwDUBO+b5UaqvjF3As3fWjW1X4wlmvDtD7ShHY="
								"data: bryn (broken)":           "6O3ILoAc8FX7s+6b+gNeXS8AzV+3yZYYeGBDg5oKKvE="
								"data: charlie":                 "6KD+hRodtsjCUPOldt+FbiBLws2ol/kmfOw2cuYxk7s="
								"schema: CUE":                   "hVlolV3WjD2qlrxksRvuarkoK/O+5a8yR57FWdUaXHM="
								"data: bryn (fixed)":            "/5LTixZoBF5SKry8Tmz/qWs84SgAwrc8669kbk7klKY="
								"data: alex (reminder)":         "SNVY71yNnRCBcnxWG3m9PqjbcWrXmQdphhcr0xsTWyE="
								"data: bryn (reminder)":         "xo+B10+b+zr7qUQKHd3ZyWtoEksHHOeYvne3JQe3zrA="
								"data: charlie (reminder)":      "nrn3yd3bZZ5ZC3r24/WuVJbC+rW2kHEM1Io7KClR5FE="
								"schema: CUE (reminder)":        "RkIMD4Pi6xx/heJ8Sa/OSkwyQji9fnV0mg6BTHD3tfI="
								"policy: CUE (too restrictive)": "Y+g7IlKlOI5lMdK+b3f4rmw/ZSzgPXS7WlQo1smI/V8="
								"policy: CUE (correct)":         "+2rBkNuygdpZ36uDCdpcq5gS4S3ZqhewqJiWKwmPUwI="
								"schema.proto":                  "IJa83f8khCVueCYbxh/iNyQhrpNP+h/rTVvdolH7ohM="
								"schema.json":                   "uunD9cZ0Y1YQlB7qGR9Gx6+oviJbsfdK7PLKcmWgeYs="
								"policy.cue":                    "oUikWzjQgRwRTzMV5PGGKuzbbAM0MFqUwSSsaav6NTs="
								"data.yml (broken)":             "/4SYneg01PozQ0JO+oKuHuZi+d0iVG4tCuwmDHTtxHg="
								"data.yml (fixed)":              "eBBmw1ZTlr/3ldBCYm9VfznIMR1yTDFD7cTStM1A3HU="
							}
							code: {
								constraints: "Jj4MOWeF8qaNUjOuBD3dCbcHsQ1tArhOg4bB+s4tyx0="
								definition:  "VB71pxpq4EH6DHJKzHVQUgGPCVd+b8VPThdzQZ+pESY="
							}
							multi_step: {
								hash:       "9R08TR403GPKPF3J7FPV0UVRAGSNU0KH821J5SOA8PN9K04UMD0G===="
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
