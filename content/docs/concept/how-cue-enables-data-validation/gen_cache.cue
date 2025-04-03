package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "0i0+kW+gVlQ8mKGC3y4G8oU0mLtpelh81MsOGGDd4Cc="
								"data: bryn (broken)":           "f5JiCm7vmcGhm4jhD6LDq2wN/pzJIZiOhzz6A7WTlQk="
								"data: charlie":                 "HZW/fkLZBlFkcFofK4GLQtmx1MtA7/HuA5Z1NMj4tWg="
								"schema: CUE":                   "Qy43S/8aPOG3bhn5ICVpdKTAH4cj6B+egDpVVVl9Tjc="
								"data: bryn (fixed)":            "LvtvQQVspglbMKCS1C09nLbWBr3xrqXbbtmk4Oz9bfA="
								"data: alex (reminder)":         "Bdqpcmj6UT8MA7EKA6GamnioSKuLvthBGwCrRkuleHI="
								"data: bryn (reminder)":         "gZNK4HYkMFdszm5So3CJAr9nE8+lD7s0vTjPhYDXI+A="
								"data: charlie (reminder)":      "Mf+VOxlxM83AgqVsYNMiJPOOyasO0Qo0jlrT4gcIvHE="
								"schema: CUE (reminder)":        "BqaU5l+CA96uORfFNrggXIRgbbWL2uSJFy3Df8nKGqg="
								"policy: CUE (too restrictive)": "L/EhvmLFFTGVH74hgogJk8wt/APHNk0KRPgdjcj0KJI="
								"policy: CUE (correct)":         "2g7VrnupvTOXGMfteGUGLgOpNojAXU1rvorrMcwLOms="
								"schema.proto":                  "MCg1+UPJgaKf5PEs+rllbRALjXmeUJT5ytzkPxMEK68="
								"schema.json":                   "aaZ3NwPLb/cnbLu0tkDrzRZiXPhyBCTBCnaTF4ww7CA="
								"policy.cue":                    "xFDJ0a3DkxEuJFbNWSwkHJNgQgcCvfTPjFpXXlvaXfs="
								"data.yml (broken)":             "rc3UQwOc8aUNk2O1DPz2bdgU8Kciyj1vKRI4K1gSoyw="
								"data.yml (fixed)":              "vX4mvWsQXZLlxxXVkmIIO+G0fCm4KE8G4PRGxTRpOdw="
							}
							code: {
								constraints: "54Zkv2UNNh4nrKRwJxioTx68x7tMgK9SWu/Lt7KnrqY="
								definition:  "0uq2spNzZ8JtKNUvK78YjzcL+1eM2v3Ik+5XtgWDAEQ="
							}
							multi_step: {
								hash:       "DNBINLBHA3CD1KR8VCI5SIM3EQFUVIABR1V4NSO62FKV0IJG52K0===="
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
