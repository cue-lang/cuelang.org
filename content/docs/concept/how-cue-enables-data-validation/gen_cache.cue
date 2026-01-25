package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "DC07pnR9l+StKB+qK6gwxGQXAqVb/OtHcVpf9264gNE="
								"data: bryn (broken)":           "1BR5/DS1WYbvNMjENF2B1MQiVEzxeQ7ocSUQGzVRmgU="
								"data: charlie":                 "yWKlCmOZbx1xJBuMqrVei1vvHOdUie8vaZg8HLbbYMk="
								"schema: CUE":                   "XKn5gq2egu5m3wuKJWVbqUGDbUjtiCZbpHQwoOouFL4="
								"data: bryn (fixed)":            "biGjYljIEo/n1MSEuxgDop0jN3TZ7EZWc4LuPL+W9W4="
								"data: alex (reminder)":         "MULx4ScMGNUgdQ2SSjBCTx7DXOBOATxfNKsxjs2cE60="
								"data: bryn (reminder)":         "4L/Sr1J4RQS7MPUvjjRblJPxLfX5fG921suKoC31wcA="
								"data: charlie (reminder)":      "++98ZngAPxEzbe5azG48gPFZDWN+9LU0myuxTOlWINs="
								"schema: CUE (reminder)":        "whbzaEKOXDOcDGj4wm7EdrsXzLbzPUj82FKKX4kPC8k="
								"policy: CUE (too restrictive)": "jvmkOeI55zy7TI0U/ba3dzOI+CpnKwcY1EfeYops0OA="
								"policy: CUE (correct)":         "8T9Xcv6AoE97FhiLyA2cuuYt33gJakg1wj8dDUqailQ="
								"schema.proto":                  "lAoXpvYIp4OuL6oNybNh4YMXxKYg12rsK+Fo2u5xz3E="
								"schema.json":                   "Z+DZKKQK+Ri/dY4Vxt9W+EG/3Tk+Jx5zZtJ6aUUNfBU="
								"policy.cue":                    "b3TgDzR+XoUoQVQb5eJBX/fRHzJ6aGBpE1oB2G3IXXs="
								"data.yml (broken)":             "OmfM4/tsWVDWlXHQpm8pQrYW4ym7UCAkW4DOsY9ndZI="
								"data.yml (fixed)":              "U2XE3Z3SOSpTW0iWFY7SFHZxwlWWnSPmRFstiXTQZxY="
							}
							code: {
								constraints: "weL3FANcaOEqEMlyh7+SriH/pLOKLVrWbR0jQdmQt/Q="
								definition:  "FB06jsP+JH7JnEpZm6ru7H80udvdNoUv8JKfuqAMuNU="
							}
							multi_step: {
								hash:       "HVQK160D69D8QG1ETJP5DV027T01871N3CAO3CH7BNDHHAK8Q2V0===="
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
