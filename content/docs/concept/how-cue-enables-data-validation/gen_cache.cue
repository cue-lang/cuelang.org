package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "HSUSospaE2jCJ3gHizSwJpXoAL07va0aZUqs8SosD3Y="
								"data: bryn (broken)":           "PFZJiL3Zm5o5c33xEV8oO0K0RxLdkaCrHCi6qY+QZ5k="
								"data: charlie":                 "xwVKjlDfrRJR2KWX6UfZ6fMPDMlO4eyRdRDnVN2Ajdo="
								"schema: CUE":                   "mlAHrtGTg09mf24vBDR2ILz+CJ4nHSr+oz1wY0xvdEQ="
								"data: bryn (fixed)":            "j5SqlxJu7hDugbss8ZcyNrGLknSfpOAADXtC6lp9i9c="
								"data: alex (reminder)":         "ty0tg8HYk8e1NQM/s0N3I12P4peRgY1LuYodlm+m9HA="
								"data: bryn (reminder)":         "q/+K2yhBz1Xcn9px4mQ/tLjGgDNydUQ1SVvAqF4l7W4="
								"data: charlie (reminder)":      "hqY3ADt8UOU5e2PihQlHf28qB7RfHLIqZ3AaNnqwhbE="
								"schema: CUE (reminder)":        "AJqZBI67Z62Y5cJen7+PW/EbUW78XoUJcF7DUCPP++s="
								"policy: CUE (too restrictive)": "qiKfweDdD27tXDLs2njh4s/48x/Q89DV0Snw/+OT8D4="
								"policy: CUE (correct)":         "NgyjlCw+IGo7b0Qod9c7sxdDny3DHxQGdsk1qzytnUo="
								"schema.proto":                  "pajNPQDQeBFkzSFipErkQYp0S+4wBWEqepCbP8nkNkc="
								"schema.json":                   "qbhgoVbMPfkCzO48jryRbYNsb1GF7rKyWNriOBwR3Ig="
								"policy.cue":                    "VwYX/mB6mj6aIzYAaUcQLhZ2T8DYfwnlUSZ66uBDi/E="
								"data.yml (broken)":             "NegqsQSoxtVSUC4oljZizAzvaxyczRNfM3MuqOv9Oro="
								"data.yml (fixed)":              "z14SGLQsqqAraKDwSMwsrfzrJ1xDJzgY2dz9G6LFfjw="
							}
							code: {
								constraints: "32oUwnWxkdYtTWTdY2sVYp74AjbefYqK+61+VVwVdnA="
								definition:  "y0OyC1bmx5qsr1p8jRom66kvKQPAkAsPVu9cEzxdzww="
							}
							multi_step: {
								hash:       "DECVT1S8UAJI0UHIJ6KLCOEE7GBREG72RFNQQF09HFJSH6RVPE3G===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
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
