package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "tqm+rAOfEHB2QGU9avdIhbf0dnRxkBDB6WcreGXe5+0="
								"data: bryn (broken)":           "Rpuk0X9kGYVSyT0n52emago/zFJuVGd8Uu1gqKo0pEs="
								"data: charlie":                 "b5LFy4lAG/2NZh7cjPELH7iA4Xl4GC3vKdwarQ3xAi0="
								"schema: CUE":                   "AUc7g4Fe4vHPpxz04aKD31H/Vq7kZ1TgpxYSwro6kV8="
								"data: bryn (fixed)":            "s0kERXtMTZ4XuL4Q8WZuilONvfv0FJ/4J2HIv7cEoG0="
								"data: alex (reminder)":         "ov9q8gDqi70kip+guVou68u1Q+R2/CksbsBMXqwgFNM="
								"data: bryn (reminder)":         "9ZsyouXGu8U0G0U1HxFyFTnFRmYU47zcm/lAKi1xENw="
								"data: charlie (reminder)":      "OWGrtw0zV7YnJcWPFF9rcNtTQqPhPDqxJFzPPCj7SQo="
								"schema: CUE (reminder)":        "iABgvswU3Um9yTB5C6FKPgWoMifBNgAv3WcKdoduFcs="
								"policy: CUE (too restrictive)": "l3j3z/uZKnQILw7LQZlpvqsB3FuPhuQFg0XeE4wxnGk="
								"policy: CUE (correct)":         "kX3AUwkFG4C5HXsMYa+Rd3ezusKg5X7KeZHENPn93Q8="
								"schema.proto":                  "pV2EJ80f1CwqEx4hn6zEvfdZcr8o87ZuoVVvUk20FV0="
								"schema.json":                   "9HUwq/sa9ruWjcVeuj5TkpnRNj7tEEt/vbKWNaZdCRw="
								"policy.cue":                    "qxK7ckOtNveEwYruY1ZMW7n+6wZEW6pdi7uXVX5Gu9g="
								"data.yml (broken)":             "dpIeJ/s8ESGr+ymc9DHPh2pCRf+96p9tnSvkHoz17vc="
								"data.yml (fixed)":              "RoW4A+FKD3bFKHkiQYamEtyNiv/M9MRQmt62JBrmQdI="
							}
							code: {
								constraints: "9erLmQ8+gGF4xo7+lHGk0RHqveKGJ4q8OSuQbIc8b/c="
								definition:  "qEZOCEoJ9yFvnLJWT+pxZfcCyANOaoMZXDfiEkkUAoI="
							}
							multi_step: {
								hash:       "ABL0202C4O3K4JUJ4OLVR3BMFL6RC7KPEDF5ENTIF13D5MTN1FIG===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
