package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "vWYs1NVX+c/k3JTrdeCVQudMsySZJ9svycYAk9oL+RY="
								"data: bryn (broken)":           "w+xgsz93/L4VmS0us0u5Iooc0MtXtD2bZ+n5mUiND6c="
								"data: charlie":                 "qjo9Z4utskewFl5BKO7+6AnQqaPqcWUP3cm5plBXgMA="
								"schema: CUE":                   "TJCWhXHx45g4wZeTAjhh7tv+uG5yL4T3QpW8IvFxHu8="
								"data: bryn (fixed)":            "3jMWtjb0i717dJQ/XAp07XZHcH1vIa73T6Ac0Jvbm5o="
								"data: alex (reminder)":         "HSZgHFRN5rlEROKlEqhIjwTF0L51esVe33HmIc55J+s="
								"data: bryn (reminder)":         "zVYYuf9gcUY9M9t9lp/jM5Urlj6mY9wkKfU0q8rlWy8="
								"data: charlie (reminder)":      "OE6/dw7i+lazUURluLdxF1groF17kZlDT09gZbxs6xw="
								"schema: CUE (reminder)":        "u55VxQZyVvVq0KZvvwbxBTHQMvFpH2Ljo3fWDsCgHiE="
								"policy: CUE (too restrictive)": "qvEPN1ydUjEg0DPqh5ldKz7LSTEi/4+UvAaaMCU+GAc="
								"policy: CUE (correct)":         "eI2q91YeBGC0FKH36bd4neEsGNJDwjiWl5BiDTdd4uk="
								"schema.proto":                  "TgaavyrXSRHy4J31Pz30XIEe2cjt1NvEnHTzfnjDcnc="
								"schema.json":                   "YLZuMPOeOWLqO/mxKCKiEQgBS4/BDqL59/Qq0ddftU8="
								"policy.cue":                    "1gZuextwiC154t/Z5e3FQ9cO80gnFrWX5PrBeV8iYgE="
								"data.yml (broken)":             "TWZOJBK285ubKGeNua+aFLQf0SQ6zfEMCoXrcGEpq3Q="
								"data.yml (fixed)":              "lbMH7GsSr20Qz3lR6N9F09URq2CUyJbfKjFzAQGJfqU="
							}
							code: {
								constraints: "/NgAbrXyIsVwz+BzvairjDPiqw6TQinlSPhrgOKyHqY="
								definition:  "RRh0WqJ920LpOP7EKCQ08tt0aCNmiq6HT1u3Y7MZmCY="
							}
							multi_step: {
								hash:       "3A6BJB2N96MTDAJKKJIV0EINMIML87N76M562M8QFVV7U62659I0===="
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
