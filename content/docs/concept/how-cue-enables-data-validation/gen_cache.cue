package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "jJ2S/GQyeqbEOVMREhEe0e8JM+mDviwymoF55bHf1Ao="
								"data: bryn (broken)":           "8cE0K+DKRwdK75J+dtAQS6r3KD4IFcLNkhhxSk5JdBk="
								"data: charlie":                 "umk+fVysiN0LZ6huJj+eRKi3dT7lo5LyinDMLRFJTr8="
								"schema: CUE":                   "Z028i+K14+I80SKD+j06Y9Q0TzoVxiabOYJzGswUfBk="
								"data: bryn (fixed)":            "l1+H0T8XEeXexJoAKqWZdIO4nUtB1N+Q9B+LqEyywBg="
								"data: alex (reminder)":         "npUaVvEdJnG2bAl4TU5vg5kH0pzUzCVJJ6PArV7QhTQ="
								"data: bryn (reminder)":         "dL3WFm9FIkvyMOCH7tnTo5oSKoVNPIz+OcaB6Cb/Hvk="
								"data: charlie (reminder)":      "qvZZrTmEYd9C4GDq9fVJCsVw7fGd6D8bsGib3KY6b8U="
								"schema: CUE (reminder)":        "NxaWyULkCSGaNh9HVHfzZd7WjcQXSPXKrwX2XrmklNw="
								"policy: CUE (too restrictive)": "D13zcJB1KKkJ4kElg7ICMR/5wJV5g5F1T4BonD9Ya90="
								"policy: CUE (correct)":         "D9+0R9+hYuKIsayVK1ObmKNml//+kebmOiatFE6/Bxc="
								"schema.proto":                  "WCi8cJhIRHUaZuYrCSY9Qdo4PgSiy8YfmXfXNNQDzfs="
								"schema.json":                   "aJX3x3FD9LQeRiujkKtCm4Q6/DuUzCu0T5jrSzqiDTY="
								"policy.cue":                    "pSfeJOSazUFsbtb8NObC5WjE8EIkOH0U8sOC+ghHAwE="
								"data.yml (broken)":             "aDd7BstuQ0W5L41FR2tZoY70/5Fe8jtDVNqhscZW3hI="
								"data.yml (fixed)":              "bs/6M258Dnmhg2Vqgqo6PPp/oWXzX63frGuHsqnm3L0="
							}
							code: {
								constraints: "x5CCoOKqFyHrnAiZDjh4qeerhYVHUQVFMOfrOrM6ctA="
								definition:  "bT5No20jJQDhj569AJZtpR5fhteozPv/Kom0Uvx5Gc0="
							}
							multi_step: {
								hash:       "IKK7T0KE5N2D0OB5K32G3EVTQJSGHHHRQTO4NQJLD33IQ6AC8KDG===="
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
