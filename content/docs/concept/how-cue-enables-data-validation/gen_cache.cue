package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "MWvRCIwtN5QkMTMbFtXZqdS32uMRVoTI6VzBkcJ+oNA="
								"data: bryn (broken)":           "DtmWPxS19QQKoDKLftwJGpua2tthIP4HENzSi/FxE34="
								"data: charlie":                 "jI7woB23Rqo2ikaAw8ppY/S+QvJ2sYtL4GF3NWfUSGQ="
								"schema: CUE":                   "QswW96afXilbm+DAP5m12s4XOkwC97FcZwl/pHTCAIo="
								"data: bryn (fixed)":            "5Z0XS/d1otLxg9lULsw6hGdkcWXwm8zuKOaTouV+82Y="
								"data: alex (reminder)":         "feKejA2y8TW43mh+MvjT6uWPKZogm7siA/Pz9HnWIwQ="
								"data: bryn (reminder)":         "HeyPrdMYih9K/L3JNT5CwyjWBBb67dGtDqErFg3g4Ag="
								"data: charlie (reminder)":      "03FbYG1bA98HTNea0VHPG17h9cf+tOoVEfGtB27ChL4="
								"schema: CUE (reminder)":        "aRQlGR8Hb9u6R/n6kG8w/y7MYT1QQ4KQEbAt0Lvp6Gs="
								"policy: CUE (too restrictive)": "dicr1DdYo2QkfiAmx8psNymvqX5b28vpF8TsM6Vntnc="
								"policy: CUE (correct)":         "HnbgTODizwmusoAabXuRmSSkXJs/dBYHKY9ZmRzEGAE="
								"schema.proto":                  "LLWkc1F8jgtziB+GXOocyzTQBt8+Xmc+x9aRbQ1VVK8="
								"schema.json":                   "rTt5TS8al8ntSiq7OV1dTWe4vaFzKsq64UQskaUgZLw="
								"policy.cue":                    "0GeWXJqJH/z3SEFT9XI3E00dDpaRKBQ6tKzP0YD02OA="
								"data.yml (broken)":             "xIq8ieK/H/xQeCpw31dlx0Q8I1PmPHuB/mBvt6ETxv0="
								"data.yml (fixed)":              "kr7sg9uvFTckM9D5c418BMKXrBAjQx3cJhUXSiDxs9k="
							}
							code: {
								constraints: "LnfkE+DWbxCL5clOshgCGVvy2vU8H602MIbS+l0sxLA="
								definition:  "/oUM6EZU/XKLpAgciwEgY097uUDjIupmTtX2ocOAPg0="
							}
							multi_step: {
								hash:       "D4758DMB6K49LB6V69JTIBT3R67S0P9197S0L5A5HKLT8DTHT9UG===="
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
