package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "54iRojHUN02A1w7qHLO+2u9UnZhVTnw9/ck4cre0DDw="
								"data: bryn (broken)":           "Q5gwO3RyF9p1I1FqW+UinHvSINpo+dmUkcGcLZy1cIc="
								"data: charlie":                 "K3rUlXwydXb6hhpIbtZ+KWOo4wJj1LREPsgxQS9FUaQ="
								"schema: CUE":                   "p0QRlsQ38TJjY6amnw3LNJ8F8mJ65zuN9Ic+7E2d3+U="
								"data: bryn (fixed)":            "OAaadKRQajxcYuecAOGLAz4ZHFqc0ufgC0AGXhw5NX4="
								"data: alex (reminder)":         "wbYASsCGTv0SOc0QckD5hxbl9xK6BNbZw4PRow4hj5s="
								"data: bryn (reminder)":         "Xg5Ymm5GBo/fc2xUkMygb6VBhXGBcwln0l78ZavJHf4="
								"data: charlie (reminder)":      "eyZHgcM7r38nZnR6V2hvbAQGUV+lZz79Z7oGZwEyO9A="
								"schema: CUE (reminder)":        "BebQ+xmLPRpsX14YoGqBXqW1uaN3GJuerDszVYQphok="
								"policy: CUE (too restrictive)": "vpmL60zg/i9B+1FITS0cSQlrD4kuanzwGhogTe2F7fw="
								"policy: CUE (correct)":         "3YdHlMk5Cx4H/UHPh5Z71/p2H8LFt0XTYSBR52eGONo="
								"schema.proto":                  "FX322hO/WYM0Czhta/BBmHYMpZw8MKY4XJfUZJwWNuE="
								"schema.json":                   "6HqcTiZ/0Y0G6jwIRwTvGdFqxBunVQxRiP1/w3Qek/s="
								"policy.cue":                    "mXwYiPGw5YnpfuTdeiQRn1xPZQqFbomYHG4pBsTg8lY="
								"data.yml (broken)":             "O5ifMl+6jgySNiibI7SDNAV3i7JprrEGq3P61SQdlxU="
								"data.yml (fixed)":              "TRdGX6ug+371R3pHY3HZeJfe6+afO8zKWNKGw8h/mOY="
							}
							code: {
								constraints: "QhUp1b09hmcDn4uh3WAIwullWn56+BrIOq9SdmAmBLg="
								definition:  "4tVrg1aj4ChGXuYORwU0kP20fHpUvEzmYTZI0LHK6BM="
							}
							multi_step: {
								hash:       "S85LRAVVJMCJPTTVGO3QPBOAI7IJAGICBQ5MU3M1DFCQ3FRT1VO0===="
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
