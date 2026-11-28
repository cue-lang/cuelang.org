package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "FvcmwFnwDmHkKe3ohMRwtfidFWjp//K74hsMoGBDwUw="
								"data: bryn (broken)":           "PW5LlR62bGpYBCWcjphnbimcij/J8y7agTrnS2D4Slw="
								"data: charlie":                 "X8qwLHq/8UjEqu4rIIUj8EPvF5wXCU8l9Sd2uT8dJrY="
								"schema: CUE":                   "ksZzdS3e3OR/I1HBOA+QQJ+O3muWNd52tuRfBgbgzV8="
								"data: bryn (fixed)":            "7aisSLsMystZcw03EHvdJl7nUFGMgVKkSy0SFCEu6to="
								"data: alex (reminder)":         "DKlIJPp7C3AbvEzzqdrFBgD+5DIMOMtGeIrGWNmFr7M="
								"data: bryn (reminder)":         "cUPsiIpCf7phGY3a8/sYQzkXN2O34FhPczM2jSxAy9s="
								"data: charlie (reminder)":      "cK1v145qY85uzzKcz1xOiiSHWPilUnqG8e23xXrE2K4="
								"schema: CUE (reminder)":        "SHVAKJuNYQzMuyY+mR8ylTV7xgak/LQAc3oK8q2I7qk="
								"policy: CUE (too restrictive)": "WS+o++8YzB5eL5DWOW+kjDopE7fRjCACfnlA0FlWcDI="
								"policy: CUE (correct)":         "2PWj+3t8O9Ywe1idBKKzgT9bLg6J1kZbT5xmiiZTzDM="
								"schema.proto":                  "99NxvxwjTio6dPk78X7xJmAHv9OAZaNqAyrVm8n2Bbg="
								"schema.json":                   "8fEwMlnnepFh2bERUyZPRx99sJmJGjvRemR2nZqOIy4="
								"policy.cue":                    "rEjTNpitKquBAhn8cOVSpffmCDucQ7nFfr5GUiArCzA="
								"data.yml (broken)":             "puATaaMlX2JxlIPhfald2aPg7xTOZ6wrvGrA5z+b+QQ="
								"data.yml (fixed)":              "KZ7Py88BGqL2klwpcyyd4Q4ngyPLHEKIXZ6kCTRk6nw="
							}
							code: {
								constraints: "OUP3fHHPhKmLBrYJ/gs3bzsaDRzgNoHmDhBFLMggE7U="
								definition:  "ilH0dbE1vjlcae00h79OA3iRA90dKYrBvpkeB5tU9wk="
							}
							multi_step: {
								hash:       "E2PK9FG9V3TMTG4DEJTTFB9C4UD0JS3B3L6DBUIQ17BSKOL8RNHG===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
