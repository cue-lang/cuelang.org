package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "vMkPZ3xXlpzZsQqW4meEDFtj4rrR/YIL1ObcBXy+aEE="
								"data: bryn (broken)":           "8jqw6dybNg4bqjuTJ6iL3uoo1xHBudf5iQS78nAXC+8="
								"data: charlie":                 "NWxjIvNnAku/beuN9NwLrv6QWXbz6jDP771jvjPWsk4="
								"schema: CUE":                   "P2SHvwHuhOO1De8huo92OS8jBqFIOD9zTxEGtMO8C2Y="
								"data: bryn (fixed)":            "7HoJc+fRDhL0c/dEWcvvdFlhFKNqz+D83jIFyHG2LJk="
								"data: alex (reminder)":         "XDOoSp5CqF5XwM4OnZP8CUsLozfx4txUoajlz/heN2U="
								"data: bryn (reminder)":         "TyavqMNmL0hEyi0HBx9rYU7ljBq7t2fKyMCgZ1+D6ls="
								"data: charlie (reminder)":      "fqvVyN3yxSqzxETU35N31PjbabtSl6EC583hzDEe6lQ="
								"schema: CUE (reminder)":        "AvNBDdIrBB/v+8Q1/hGOp3l/778LUfKn4hnKWaHgzwc="
								"policy: CUE (too restrictive)": "Tw7dJL2OtTsWw/p6l7Qp8SFhUWM5hhPubSPDdjaVMY4="
								"policy: CUE (correct)":         "x2d6E1JRfA8iklPlDoU87h/tDZp26Jm/3GklYI3EDno="
								"schema.proto":                  "ouOePS7n/dXz4Pc7iFZDUYIUh+8/LMgFFUMY33ZMiMQ="
								"schema.json":                   "LTrmgxB1Om0wiUyReM5fkfJrynr+3BQ7W51e5V8zs3Y="
								"policy.cue":                    "5BZJn4qvAOH9TSZTkZRKRPr/Jtw+C56DOHYTz8IegTM="
								"data.yml (broken)":             "EmN9eEJ1ofWbu4zIC8PmneggsQ9PPgvxAS8MMqKX4Kk="
								"data.yml (fixed)":              "xpn0RNzcyz4Gs7koHT6oKyMUCfGDfMylWmB0/g6iCIw="
							}
							code: {
								constraints: "66Iy3yP1lDWz6hER+EppVKlDA88/UQPvfJLHH36i+pQ="
								definition:  "s78VqaTrBs2WK7JHiT1HQJD3626x1CoIlbkYB//MLkc="
							}
							multi_step: {
								hash:       "17TE9O8LGK7DVF6VCGL3GER7NK039JM1P1294KNI0J4T7JPLMHMG===="
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
