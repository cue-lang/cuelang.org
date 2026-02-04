package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "EIgPY+uUf+qAubMTtPXydFS94PfYQtdiYCBf4vI//qw="
								"data: bryn (broken)":           "5Pl/3CId4BLWgKATvBT8ri8alDodGkZi1vtXqxDj+Pg="
								"data: charlie":                 "lzcWTgcSdyG6TeagsGREHM1crPe/GavsguJGQED2GIA="
								"schema: CUE":                   "QECTm4Dc2vfKwEl+8PhGey/mxS9pl8tRDfKRJkBHYLo="
								"data: bryn (fixed)":            "vQ8jN3qGQBzlXbcuxqeMv9VgXu7tQh6qehMFo6gEK9k="
								"data: alex (reminder)":         "psoUayZI0VTvVcG6Vfw3BD2BNRoz7w30VgsZC8K78UM="
								"data: bryn (reminder)":         "aK4pjcvEoMD6Hv0hoNX0Oey6s+ihk6ocY67VOfBvtAs="
								"data: charlie (reminder)":      "c7llKptfQ6SyDk/XA2dUvSncD0vVpb69JTPgUcVZvJs="
								"schema: CUE (reminder)":        "/MBTX3TPotbB/aK8CqmtlxJxxWQFE62K0eRIOEdK17I="
								"policy: CUE (too restrictive)": "sZLc0c13XrpAfue1cvapDab46S2npwZ+GPAnvzl1Ik4="
								"policy: CUE (correct)":         "b5uHvQIRy9445/9I8kKUQJvVVaW1kLkhhnFH/i+aFK4="
								"schema.proto":                  "ez0llNEV1JhIPjw/EF5UnXJjKPggG81dwuq3DK53Hz0="
								"schema.json":                   "ULlgKR9ipO31JqLJtBvC4H/fN7NVeEZhX8O5BV6G2vc="
								"policy.cue":                    "XyG/9aoyp7JqDvoF52N2xqL9XFIWZabS9D8ELaC63e4="
								"data.yml (broken)":             "V/AGdlQsYCuZ7IcYEMHn2wZ92BT4/2vJpn+w+PdswG0="
								"data.yml (fixed)":              "431PfJKMZZR9wq8JgfEsFmpRqvX+pGVhL8b3hdEk0hk="
							}
							code: {
								constraints: "pWn8m6nH1/xS79RpwQ8JQSH7NFMeJ1QyGAOim7/TYOk="
								definition:  "Nbm1prT7Mi49y9DYUeyUSEGp8mpK4cXpsxoOmes3/i8="
							}
							multi_step: {
								hash:       "RNGB5TONFKJN86MKB4EPRDKQPE45AOTUM3NC208U7KLRD9CIH6IG===="
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
