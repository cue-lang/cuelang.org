package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "WD5WH+2vfp4dZ9EBRNof4S9rap/o4B2/wylGoSDoRcE="
								"data: bryn (broken)":           "zhWpXca5vbCj/QQSOzP1O9I6tkyBh3SQR0CnHJ5ttdg="
								"data: charlie":                 "S1sTPnOFEUan+kpvTgsMsx1MCLwqTxSquJoRbOhu+EM="
								"schema: CUE":                   "i7cS1Mh8rmfX+1NPSgnS0umqtnyL1h59V90Q41nZgSs="
								"data: bryn (fixed)":            "MtiAi5f8Yw4Kh+kerfuwGx6FhxhSJJ6NxaPIyzwfEtI="
								"data: alex (reminder)":         "3hzutVdeEF7gSXzmTeqdUy+hXeqJkK5G7CpqfJAhCY8="
								"data: bryn (reminder)":         "OusJ4X0v7VORrC9gzbAqRqj8HnMEZFhOBnMnWbYhCJI="
								"data: charlie (reminder)":      "11kSdaQPqFGU0qfAOk141zxFUzBbv/y9PKggiFpf9Us="
								"schema: CUE (reminder)":        "VWeRcsUYpfvHgcZteoQieO5mbhihQc6yC4ggsncEANY="
								"policy: CUE (too restrictive)": "r2EB9hl1iaMDnHLmd7/bQ904GbdgfP1raeJ73yF5DaI="
								"policy: CUE (correct)":         "23dfjb9CsyoGNbevK4PC7k84ZM0EXV02hTAQuOYkISs="
								"schema.proto":                  "cXhmklS9txQooIY0snrxr/WfMPNuRxitRMBpbEWRKRM="
								"schema.json":                   "nUSAzdGDyeO5SgqAT3joQVR3fRSOpieCJOmSDgGLls8="
								"policy.cue":                    "IsWxQY7sTZqjrkesGLGy6JFCfxZoqJorSnnM/K19sMY="
								"data.yml (broken)":             "1/25N/12EdTQfhJldmHmlTZ5PixlXWBzOyEjLFstyKI="
								"data.yml (fixed)":              "uVjt5euUd+3+87+FwT0hzVvllAE1bMfWzVS0aFztAGI="
							}
							code: {
								constraints: "4gabhzPgApQ09qYxkgcW+c0emu026PqkIFAB0qU1oNA="
								definition:  "KrS0jhsDmjm33UEUXqNHYpbhgtFhTfO0THtPV/iBAuE="
							}
							multi_step: {
								hash:       "5LGD1H4HJNHNCEJPBM574UB6R3H6K9NL4FOL8372C0CE9O53ACQ0===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
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
