package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "GbekiTbU1pWyKIXU3hi3p2lt2prkP5sk9cnR3+0eOtY="
								"data: bryn (broken)":           "EZ+ggPp81d7XGUwZl6CjAP5YKvHtsNWYKoPOfk1qNn8="
								"data: charlie":                 "m/GDH3FVI/2f+x4aYlFk5O0Mty53JWLkI2MUQTM8bz8="
								"schema: CUE":                   "yR5LFhWo3HSzHZNHXM6d9rQ+jrvAeWCdB7/D/RdCoIk="
								"data: bryn (fixed)":            "vdyl63z/O6gurR7R/btuOgENCBAOOVf9L9a8HR8kMGU="
								"data: alex (reminder)":         "sWOyrLlxZ6KjA8QcTmQsADVY/TboNCOB5W4dokhcuCU="
								"data: bryn (reminder)":         "ZL4QLU+WKWvudvu820lkDziNwdlGRdFneDjeyJe0nZY="
								"data: charlie (reminder)":      "Rq5/R0iYVVD648t2Bd3a7fyD2KhzMiKCEAhjRIp0MDw="
								"schema: CUE (reminder)":        "poho3MMVLdk+MDswQloYBh4SOuJfRvtRSCqptdiG8eg="
								"policy: CUE (too restrictive)": "pBjvmFG4MU139KCWbsECaSTbPWnLzaDLKx22dI74k74="
								"policy: CUE (correct)":         "VGfBS0mrR7gAJv2vwSdLNfQhcAV328U2QYTBOOBxXCU="
								"schema.proto":                  "z0pP/ZU0Y8yIla44GUGIocUhi672+vSXF9tpbFClxY0="
								"schema.json":                   "Gi1Vi5yShJWLThCH5fB+s7xg807ij4/tTfc+D8FxCMw="
								"policy.cue":                    "1Lpu/gjlsyILU4lw6qv1i/SN8DYTd7r7G/y7bpZFMm0="
								"data.yml (broken)":             "b2t/OZ7qWne0J+ihjsCQZ/pI4AA8VXm/c+oldgwQUwU="
								"data.yml (fixed)":              "TFfXj9HLBJjFrxgjMVEBgDmhkQHGTPb53ay58lITjno="
							}
							code: {
								constraints: "UFROz2jxiRiteT4K18amNNRW1dZVmoYaqKq4/mtNkeA="
								definition:  "W6wveMQoA8AA0ob+6nZX8ps5VK28Ebh2qUPm8Y30oUQ="
							}
							multi_step: {
								hash:       "AN0LDFHKQSA90UDO4NVUA1CAR3SPUL0RJGRCQ6T0R71CC3RA0GEG===="
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
