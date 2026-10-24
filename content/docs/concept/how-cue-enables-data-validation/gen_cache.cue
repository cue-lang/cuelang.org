package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mVGZjld7nMSOIjcVqHK94PE6NLsiMWfxIpuhFSUZ4kM="
								"data: bryn (broken)":           "0gGxd9JTrqd/98/kmOFOZb8rnPzYZwBqzlFKsAncQFM="
								"data: charlie":                 "KTwDmYbA/xR3p9Nt9KT0eLX4R/DxGahCZkNP9j1/96c="
								"schema: CUE":                   "cLATQ4BguelBhqfEvJH0GQPnfZOjnOGelsTYal1YMYg="
								"data: bryn (fixed)":            "gLirhKHhhXxiQnxzs+p7LnL+QTQSt5Bqyp4nozQKY50="
								"data: alex (reminder)":         "AF03bb61u2fk1WlG16WrzobVHunT9NeKUbpCuwCXvlc="
								"data: bryn (reminder)":         "h6zSYLwLN1QTiI93NdwJqfC9yCYqe1zsFm/XoykUIKU="
								"data: charlie (reminder)":      "8ZHalcRdXMCj/n8kpoTJ9btY/02r8mbCpUp365oEBgA="
								"schema: CUE (reminder)":        "dxtdeZImpxsIkxd9vtUKR62lsYytC5nnu3NoGctQBQ4="
								"policy: CUE (too restrictive)": "6XOcTpNCq4ORDv3Yapxj/bdW6PXhdvQkPP9MNhSaG+Y="
								"policy: CUE (correct)":         "jRBdEd0Z584QrawH6fm7EdVkckVMEqLvZlKroElvxwY="
								"schema.proto":                  "CyyIIrmK873b0o95PRG8R7tIgzyD5uw6n/u0Do/dVkU="
								"schema.json":                   "+BZ+PxQbDUdCPnBU7QTiuVfkDUFH1JPEQFK+rNzHBG8="
								"policy.cue":                    "S3Jogq5AnjQQsZ81lJXGV7tpR4oMUfZtXIFPM4aOpyw="
								"data.yml (broken)":             "l4IkMqQxMVos4/PQiHb7F0XsvikCP5NT3iF8GY75T54="
								"data.yml (fixed)":              "mKZHhb9gAHrL8ikKmbtOnvzqR68NwUS4RoyRZO8nXAY="
							}
							code: {
								constraints: "kRI3hsT2x9Z2wKGgC6DaoQEI5uTQZnSamh/qyhUoqhk="
								definition:  "Xgj+U3+hRJcPXtslE12RZ/khxRFS4RLAr+bf/VjlHMU="
							}
							multi_step: {
								hash:       "SU88FVJARA934J3RGLHA3JMONK2I15QAI786QCBNTI7RBJ72TDGG===="
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
