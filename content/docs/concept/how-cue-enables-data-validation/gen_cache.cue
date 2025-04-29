package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "DHX7D4NtsMyjmxG4AmNdWqFQ52BRTG9xWbFrYMqwdzU="
								"data: bryn (broken)":           "OE9O9S4oX6mucinRKvyZIsCOVsOkElYo8spkAJldxZw="
								"data: charlie":                 "6Xte9fVLoBosLqWfTUAshG/DhR6qmD76H/Hz7lkzGJo="
								"schema: CUE":                   "jqB3ZN6M3FLHh6Sxxdkt8x5cQEi/U+Vfovaf20ytQCM="
								"data: bryn (fixed)":            "jVFKawATbJGNUIom39Ut1pM/TcirkbyAfuhqQ6yN0ns="
								"data: alex (reminder)":         "xlpuxsVduFKvDv15qnQjlQRDmagdtB1nvVqaIevITp0="
								"data: bryn (reminder)":         "zL1iHHEbZJVs7VCjSxLipo9X9QTv26+Q5mGEWkEd8PM="
								"data: charlie (reminder)":      "moYPYnAo6wWpkw0Hjy+LoDte72uhByAPhT/OL4mWM5Q="
								"schema: CUE (reminder)":        "umufu/0wBOktlRo+9A6/S1iN8ogtc878jSZz8h6/4Mo="
								"policy: CUE (too restrictive)": "FLI7i7W1alr6HomHJjRK7rvbKKgpQqHu6LoGH1L+aDs="
								"policy: CUE (correct)":         "wDG4eXyAC259GW2A8aYMmzXR1Nmhv7sKSZ+ep0JO7Eo="
								"schema.proto":                  "Xp2OQu2SO89dai002j79ga5uW0kRByRLeODRIkENR3U="
								"schema.json":                   "gymbRqad1Am+BR9R1o018jf8jzYr5OrLxIbUQcZCYw8="
								"policy.cue":                    "t5YADH6ecbXsBZxibsZjaTXggGo9DRmGOyt2sc8lP/4="
								"data.yml (broken)":             "D9krPPMu1NWXE+F+Jz5x/0fK6D3c8xpM3ymfUGiUpWw="
								"data.yml (fixed)":              "6hzm2vuZd+zSlo2B8hrwUkHzATG/Oz3+wJnnf6N56Do="
							}
							code: {
								constraints: "kY+65EbZZthREYKLVx3891cuMct1cCKzPLFuAexGr5k="
								definition:  "m3ijZ2ZALa5BBkzFQ5HgfclJIW7hwKtZm7MJfXF0eY8="
							}
							multi_step: {
								hash:       "Q2K1EVUIJAF73KRPJIME1GR7UB852PE7MUD5J8U5APMSGEFD5M6G===="
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
