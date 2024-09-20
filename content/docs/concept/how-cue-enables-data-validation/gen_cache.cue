package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "SIwWlVQ00IUxN+u+RcSLGRZYSlfCnU2gliaYt0Kuf4I="
								"data: bryn (broken)":           "wDRbUJOkyS1enuPyqYZz7jGwXSjQnQZP2zNdWDLCFwM="
								"data: charlie":                 "d8j5nWZRKY6ONz4HjUJZ7fLFhYwC3W1yaHaTKrWW+NE="
								"schema: CUE":                   "Aw+C7YiheafK2TklgjRt2kZc/ZuOPs0VkmA3cvXstEI="
								"data: bryn (fixed)":            "cnSJdmQVQrcACRh90e7+O2q6AKgoQwCTZErTx+VEZCY="
								"data: alex (reminder)":         "rkwx1NiVFHJ36KMWKDBXP5e/G47498V43EyarEKXZqQ="
								"data: bryn (reminder)":         "qmVXWwWsPGDvC3dxpsSJ/S6UuUu8LpziATsKR5XO7Xk="
								"data: charlie (reminder)":      "Ti9F90G1CYXw3GGqajrKdRZGyhOLUDJ4DG8GnK83Kos="
								"schema: CUE (reminder)":        "ik7cgEIbMiZ4CANVgqjQGOwJijPFfIskf8nL0/r/Eyw="
								"policy: CUE (too restrictive)": "tkbO6FM0VpsxkRkd5jyvBKQYb2sOnujbAOY2qu4Q2W4="
								"policy: CUE (correct)":         "6gSiYsfyl1G3VgKjTn3gn6O/0EMS917q1KWEqB7Ixqo="
								"schema.proto":                  "p12M415cyTtYLizjXEq4uGm4GE2IK9Jm0No0MbGMuCE="
								"schema.json":                   "hDMYmYIa1ELtXOVw7GeZZP/EDfSKUcMk2KhcZN+pDNM="
								"policy.cue":                    "htVqYvgMVaofajsU/vWMe3tO4g7Jn9y6OL9EApn5HZg="
								"data.yml (broken)":             "42pVkR04+IVX3J1DUSkcRXXxUYdJC4WdyhP2+MrX/Hc="
								"data.yml (fixed)":              "R+rr0uP1qcrROWDgXum8gvCl833m65YyCzNJlOFau40="
							}
							code: {
								constraints: "D6NX6KyiYE+0yC+EiUOReCpEYrD5d0PDJcCb5qjgAus="
								definition:  "Sv1VGOMfEo6Ict8AKdZhXNB8dW/Azf9sEND0cDeTpu0="
							}
							multi_step: {
								hash:       "PMR1VN4CS13FAFDE50KADOVOP42GJNSTQQIRNVJ85P5A0JU8K070===="
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
