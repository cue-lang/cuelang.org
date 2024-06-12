package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "erPTiBYI9ksmZwlkUxkFXL331qq8Foxa433WV9iAwqM="
								"data: bryn (broken)":           "TK6sBIh/cwpe1lz1HqvdCgomTIbLG2ije4RU0IAscPc="
								"data: charlie":                 "0FjYjzyZwe7pVDiqSZfZrfox3XobWpWmgmWIrhoKcTE="
								"schema: CUE":                   "wyIKtdEaqMJGAbbCPbuydrxOLw832/BHD0ye9vfqzXo="
								"data: bryn (fixed)":            "SzBe/iLAnGTSpt9TD3dLuev7eEP3wcQ3eZkwMk1qtIE="
								"data: alex (reminder)":         "g6NqB7Req2Cwa7e2YwiJcLyuX1jfjh1IuI6FIO1ieD4="
								"data: bryn (reminder)":         "Ape/RAzyU2L5o9d+6hQOC9PkyvF9mhM8wOBqK6IIQK4="
								"data: charlie (reminder)":      "SFcWmXmieSxrWy09Bu+OwEdKvsxlGCkyLNqADDNopRk="
								"schema: CUE (reminder)":        "ctc91W9VtkuvpUanqs4BxbqEGhn5L3CWIm1IY+6SDnY="
								"policy: CUE (too restrictive)": "FDnEkXlaKsYq1AMg4R6dRV4rg28aGMdEoxxwKpXNFK8="
								"policy: CUE (correct)":         "FGtiv+roO+Rv9+hCCe2viPfBWBnEg//kBf8McAFMUiw="
								"schema.proto":                  "APD2KB1w9zdCgCYvH/FKvqBYK9xmTnZZcd20DXHgNAI="
								"schema.json":                   "VZ8LmXcc3CIgag/ADBzkyf9/Che1I0/0XEYmA+KbhxI="
								"policy.cue":                    "JAdQ0hXj+iazSSl23kLbkmeqOHS1Sa6xCHccTooUFrk="
								"data.yml (broken)":             "kc6vBlbncTETKXPwG83dnlOm2naQbdwfmsiBI5v6ZRg="
								"data.yml (fixed)":              "fgK75EZeeYSM+bTHA1m7qEufUAu85/0CnnuUUcfEp/s="
							}
							code: {
								constraints: "DbhUo9QXR/x6uffIykhLYV8bqN42zBxppXypbCdFKhA="
								definition:  "18SNzuAl67J9QzTIDfaEAHZHrIUV5ZqESY0zmIiGHng="
							}
							multi_step: {
								hash:       "D5BLCLLPVIIG0M1FJQ4OH45ELF3VNVRVPO5HQLDKP52552EDQSJG===="
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
