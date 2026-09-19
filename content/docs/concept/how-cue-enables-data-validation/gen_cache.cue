package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "5IXh0nwoLRyqPirwtfNpPSTcecCFlnV7qGvcEdel5Ug="
								"data: bryn (broken)":           "RnOxp/PcVAer2GhbNM4x5S+kREZZ1HMfoighKVB6UNU="
								"data: charlie":                 "t4v10TflSHdO9458bqjf1RKtNbX935cOtgjKOhi4S9c="
								"schema: CUE":                   "5qiXLrxVPeTFaQVKLDdvbdp4Qjzx+WY1CDLCo7N7XeU="
								"data: bryn (fixed)":            "0trH+iXfTv5OGgoNZ/EYYP1eqKVF5OkNFPhLehxadh4="
								"data: alex (reminder)":         "9Vj7cQtiT0cYQW4s2iV2n0KxKLFKEECnU0KMb3MLvVI="
								"data: bryn (reminder)":         "IWghoKZP/5mJkMDNg0qOPVy4jpL4OhHROT6zL7yIWSE="
								"data: charlie (reminder)":      "IfudYlIRBWtmakTUfLda8sDuLRwjlmCvbGvaWEErURE="
								"schema: CUE (reminder)":        "KigilZ1u1OgZ4p53tefPvnFVcrrqOh7EqOfS3lAx5F0="
								"policy: CUE (too restrictive)": "UCwGwg3mbI8pUZ0bZuq4JSS046fZbnP0wWjMC4fbA+Q="
								"policy: CUE (correct)":         "aM6/WlXWoXGt5Z6AWMYyWOmfnKgoovM26kzHAuR7UI0="
								"schema.proto":                  "xPDOOcSfn6YnFPUuAB0UihbOLPRhOpBL3POkl1dd0/s="
								"schema.json":                   "03pWWQ7bXgJ4L09yANScqQPcCEE6KH/z4X2dy9GG0jE="
								"policy.cue":                    "aW94ATL2P4OkqxPcQb71ukPDW6IhVvODSXUaaqOatnQ="
								"data.yml (broken)":             "AExrnPYN6smqSr5oDprEHM/C76v02kUho9yIFRCYZwY="
								"data.yml (fixed)":              "9PgWAjUj1SVpP8/gUZOOj0WZKf138uBbBRnyV8uKk2c="
							}
							code: {
								constraints: "3UWl6vZ42L9HF6l8Cm+R6a3WMTT292VNVlA9aryC6JM="
								definition:  "YkMsvP+EePEcC5y1aICEqHAdJRZopgmnkpd4BspaGuU="
							}
							multi_step: {
								hash:       "F2EKO6NFEKV8FT4TM01OAEU5N324V55POOS803OCUQHRFK9CC3QG===="
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
