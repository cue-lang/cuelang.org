package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "T68AljGmDhxyGTfJp2IK0G2YKBbLWcDwP30xbDtjIas="
								"data: bryn (broken)":           "qhfdfnvjUCTA60jY4yY5NmRj4O4VGyQ7opN27OMfHU0="
								"data: charlie":                 "X4BYeOdnflTE81NHJhSqzf+2gjLQtckvzm1L9bVeRwI="
								"schema: CUE":                   "5hk4JpsAfL5XfJzrkdBarNQm5qyIGvL4ABY58rKhog4="
								"data: bryn (fixed)":            "xtVpIJIZBMF5TFlENElRthGbr5h1sQmi+NUAGdUSkAY="
								"data: alex (reminder)":         "+q9KTYSRroepuQQAMLJj76++stLFOV6oxTZM09ezvWY="
								"data: bryn (reminder)":         "/qIFssaw++TkxiDOiDofU0cKRDz/cCJckHuzxNYVqQ4="
								"data: charlie (reminder)":      "rEpVhfstCHY8E4dVP1UZS1ishOhKsSy8Qc+A3XAWpks="
								"schema: CUE (reminder)":        "I9NWgtd83OGpcmq2dTOTm8K87/bYwo6+uFaXPYhCvfc="
								"policy: CUE (too restrictive)": "cX89VpzAzbqXaTMlp3JzkESUrt4FUIgt/FBWpQj9Ci0="
								"policy: CUE (correct)":         "CRknRHDkR+dAH2cOU4MaTuaPTySDk5ES19TdkYYrrc4="
								"schema.proto":                  "ZNLi6A6NW//rQK+x6TU4P2MA7ml0l3POJc/o1gsGpxs="
								"schema.json":                   "gDd2+pa/esb58cqL336+rfH4/czmU6DqKc63OUzAXo4="
								"policy.cue":                    "3w93Ldom4hJVh2iMNlI2uRT4/LG7OytqDQpnUNV8uG4="
								"data.yml (broken)":             "OrweEPshmgo/1dLiVzCxvhjmN8jjjAefkHbngH9kAJs="
								"data.yml (fixed)":              "reIAmIv8a8IcHlFZgubhJMzKKScvHF7G1knckCPg1L8="
							}
							code: {
								constraints: "xiGszFVS2IlRX/V3ypaOsXagAC4ckofoDA/hAdDDWz4="
								definition:  "C7D/H6PPjAhm3wH+2yWBWBEzOhVjp1H9WxEc299c1WY="
							}
							multi_step: {
								hash:       "ETCSJA83KSF4MLO2PGCE6GCA66PFBKVJQQ3401NI3I3KM9TE2G4G===="
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
