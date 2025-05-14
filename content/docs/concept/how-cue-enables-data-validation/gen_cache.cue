package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "vWBMP9P6IG5YmEucqMoAA/nJUfFFyg1HDBLO0AuoZQ4="
								"data: bryn (broken)":           "tlMKR9hk3r4xgp6bxexHJPMLXpYbfq8VjN6v+sF6MI4="
								"data: charlie":                 "xGumDgOCBJlcpCi4STGG6AGK6qdJMYHuxKfQajZqLKA="
								"schema: CUE":                   "2Pr+bmSN03FyeMkbjGdZWNNGqqNtNwLp7SQnQYTYdgo="
								"data: bryn (fixed)":            "uyh3O7xccsMq55rurTWA8B63DI2fPhgJaXstUAf8LVE="
								"data: alex (reminder)":         "eYg4cKy99Xp3WG/7BeNIOte1QO1MS2l3RCQQ28uGGyU="
								"data: bryn (reminder)":         "YJiVPxyF4nKy1eDLrHMDy3y3PCb8eN0/e/GyYgDD92E="
								"data: charlie (reminder)":      "c7GEo9v7OPNZ72gWyWqUTEelwzqbvSKPlDWPMbHsrf8="
								"schema: CUE (reminder)":        "6/FgaMcV7rbkQPCukdOiP/wHvcLf7Y/wTjUh5xLi9+U="
								"policy: CUE (too restrictive)": "vqWfDpgim2MZ9Kjy1SbbZxRx15rNvHINkCna9JiLstc="
								"policy: CUE (correct)":         "DbiKSLLDRr8XNutUzJPfBMkTQ4pMIYWa5CevuwYGUnk="
								"schema.proto":                  "Bx1tOVZTPZ+goAjPh5uNJDNB+c3ILENPWYtrWesjIUc="
								"schema.json":                   "VZrM1hQH857pcDQM8affJf8M/DFfzFY0LFFiItLwh9s="
								"policy.cue":                    "zE/iNQQyqqtR4w8UZ1J/Emz0zApl3VHcER1kYW94J7A="
								"data.yml (broken)":             "ogttCJErjzv9WwedSt+ry9wDA9iOlgdfFw0NDJs2N5M="
								"data.yml (fixed)":              "g0owYy0/VGUjKLlt+zVkmprx4gimxBZKnM+vSHcneM0="
							}
							code: {
								constraints: "AtI6KJCjI1fYJyhDnX+50pmH6AcIrrMlr3IxlWa9Qks="
								definition:  "ONgEiH6N6N+f5NbgWjjThptruQ2RuuiNrSBH9YlyFho="
							}
							multi_step: {
								hash:       "U7CEIEB61I1LHOSRVR3D5KJUS9KFQV9OA9HBJ296U44APIIP9CJG===="
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
