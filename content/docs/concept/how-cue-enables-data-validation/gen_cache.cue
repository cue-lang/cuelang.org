package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "GCNk0tIocQewSilzGyihVlcY09/8sFSnEDdIC6/H/JA="
								"data: bryn (broken)":           "Hc9IauwCEi4m4RQ3N8DMBFgWlkDHoZ6fqIwk8JK+9SI="
								"data: charlie":                 "w/Rp87zeTRGIRmSYVJvE2/I78oIIPyfE/EXfoq84tO8="
								"schema: CUE":                   "PKc7JxfOpExZNGNyJU5BSDJtxQo+o0ks9tOdJOatoyE="
								"data: bryn (fixed)":            "tPJW/LP+wI6cLilRpwX02rjpPMJOFZmlk+BgmQ0bBIk="
								"data: alex (reminder)":         "c1A0/4D3x5DCrUNRdBhAl/LjrrXX8HYCTc806SifXk8="
								"data: bryn (reminder)":         "uLJfgeQe0yADMn4eEeapj0FigaA3ZdcbVOizb4MTpb8="
								"data: charlie (reminder)":      "B4ct/rFWdGJisWkGWYlQF/9RLrnLsiG5e0/VbFBFFxo="
								"schema: CUE (reminder)":        "O9F19Nk+n+Lo7jRfdjcocbj1zal/18pO7SzJrABOKzw="
								"policy: CUE (too restrictive)": "7lskrXWr2ydmw43rfKLChPFt0S6ryXqiDQzWGMuEc6o="
								"policy: CUE (correct)":         "/peQq5A+xYZctHBuM/TozF4BeXXQnK1hiBiep8JDpZc="
								"schema.proto":                  "MXUN+K2dpCeXPk38c+G2ATdNTkZj4OjDgWe+WX2QfC0="
								"schema.json":                   "1gd2wbPoTOT2JxZX7ue21r+W5R2YkoSNg36inZtY5lY="
								"policy.cue":                    "1UK0xdecrGl5a6zxYm3/sbFVcOAW9HxHTkZAv00mzus="
								"data.yml (broken)":             "+JF47G7lD0gQS7hRO4CXl2WtuVEcHC8fhTgRZrmZvWU="
								"data.yml (fixed)":              "Rsd/3HzxH2k0D6AHPlVvsnMRKs7ZSGHEEnkc2MYeug8="
							}
							code: {
								constraints: "ldjJqVQ+tSivJnCF2fIGtOF8b5rQmGHwuxveIKhQZlE="
								definition:  "20RDIRyJnbMNc1Fqyp4/F+nomuGIilWrmV8ToS9NKHg="
							}
							multi_step: {
								hash:       "4JJ1CVRC0OLVUNKNQ1BP6F58IRQQV40CQM5TCNN9RFPE916BQGE0===="
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
