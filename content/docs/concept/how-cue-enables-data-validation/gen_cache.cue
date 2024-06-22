package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "0FgpoZHaWoOI2rQ/X5dVGkva13SedZfpBUSxvXkeBNc="
								"data: bryn (broken)":           "JYO1DKEtT8Q8RJsXveWiOWhHYUwq7kuAXvjU+EHw/NI="
								"data: charlie":                 "vWyraA6rzjYeqJJU9rCISOU4Sbo4Y49nzJZuSa3TELQ="
								"schema: CUE":                   "E+jcqvixhT1/olY03jzM6bbbY/z/uSqNRwKHtmqR0gc="
								"data: bryn (fixed)":            "ITZMfROpqiuFZARi2/aBPTNNwdL7UU74DmmtH/lGwqE="
								"data: alex (reminder)":         "/rCc0mXcW0tEWJSfiWV39WITqNyqAgzg5/NF2jPGdic="
								"data: bryn (reminder)":         "5Tg/Cy93yf4Ufs120mxk6dY1aQHxjCw2cl8zpbG89FM="
								"data: charlie (reminder)":      "wq1r5wqQiI/rWI53bHvyXW/8NPqIpXocsMgm01g/O90="
								"schema: CUE (reminder)":        "IljE1/C3YlAEFi6RxY8RSng+K1+IgxC7jR9eSmialYo="
								"policy: CUE (too restrictive)": "lYAf82dxgVmowrHaSNt16/NoayPOoMNBuTryURwUIr4="
								"policy: CUE (correct)":         "RaO8gEJdHNlmy8nLVx7ZWzLb/B/ZA6xjiyihWOK/HXc="
								"schema.proto":                  "Vcn/w9yK1jWOykLS5+iHcCDiIr8mjg8P8zbxYPTfPuI="
								"schema.json":                   "TYbUbYIWIhhOAoK3bhoL81EkCzVXd2QGi7gtmHQVt3k="
								"policy.cue":                    "F60VsR5tpb9Z8zV4jdrIPMB+QXluQuQrC3WSHtE6NR4="
								"data.yml (broken)":             "L4kohiLPhZT6tf9guR4dnE+M9/wE5av6ASk/l0mRQo0="
								"data.yml (fixed)":              "DylkuqEvNOAHXilWUO8n/uW1kdfCHje2C5hNzVkOt2A="
							}
							code: {
								constraints: "7uxfh2iifCqjLpuGs/a6/ZCw+Y8WtWAAPUw3mbItn/U="
								definition:  "/UxY3NgEvsl7GhYxni4ivZcbhppvowuDcVi5gITUZYU="
							}
							multi_step: {
								hash:       "6FNSA9G8OFPS53948IU2IJKLNKV031RUFO7NKUQGHA7I4LP9CIT0===="
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
