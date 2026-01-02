package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "gJVn1t1SCdHsN+jQzw5sx35wgOi4gqoC/CQdjNiGRBg="
								"data: bryn (broken)":           "Eps+W3vnFkjYOq55qWnqDlj/F4+5HiYu7M60c//7f3c="
								"data: charlie":                 "nKbTnOKk8spvJg8WxxbAe5CLn6sA8z4+CmMFBRdrR1Q="
								"schema: CUE":                   "Mx90gnQNz0CmtvjQWLJvqOQ9jiCw8Ar054v9obH9UhY="
								"data: bryn (fixed)":            "QRloC6er6tyClKduGeIbXeYVtGtqOTgunCjrgytH1zA="
								"data: alex (reminder)":         "2VtJFufHG0YT6Goc0l8100PoPyQZYdxyd3iAcbsvCBg="
								"data: bryn (reminder)":         "713ubub98r1+N3/zvrl7Swsf+07Ud/4UHvfJGlWDm6g="
								"data: charlie (reminder)":      "MabVPhr6ISsXMpVTjxurRTqdOtAVhlyeQpXVHgPp2Q8="
								"schema: CUE (reminder)":        "qs+iPSr0geRDmq0O0/69ucZ5mSLUqz1jMd1NHYHwn2E="
								"policy: CUE (too restrictive)": "h6D7KP6gelmjIs9dhzJaOzUGdxShBm/JEh+vtBdiXNI="
								"policy: CUE (correct)":         "j0w9K94u5wc+dH81s5KdxZpu0SGRpxkCbXKwv41GhgI="
								"schema.proto":                  "ofCL279qS3BjVBlQ/H8q5ahCy2y8vaMiu/pk2pwfP3k="
								"schema.json":                   "Hw7lXzwieLqTO1RqeZLzLgC0G2hfn79DucHr4V4FFrY="
								"policy.cue":                    "9LfOmW+i7fMETm+hanfypm93dCv7dSwcw5vZVOT04e8="
								"data.yml (broken)":             "9HWqTnAe/P4Be11P0byLg2vnBIt7vqkRkkYHxz133VI="
								"data.yml (fixed)":              "CMqCB+KCPhoF9uNBRsB9KFHtXnn4yLRaWcYpfuXXLwg="
							}
							code: {
								constraints: "ut13Jnk2+OJB+qmG/ez0HHSHa0gZWtTL6oTE9q2lecU="
								definition:  "AwALboz9ld/K0UCPyVjBzt5gmW95Q5pzO5BeZXYzAko="
							}
							multi_step: {
								hash:       "UACD4CUTNDCOEKNGN8I9FIUK6VCT2RLU604L9US1TG8EDTSQFIK0===="
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
