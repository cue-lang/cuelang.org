package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "BiC70T/Ya2gPol1Qn02zHo8ZvQrZWdd845QhfkhJR/o="
								"data: bryn (broken)":           "8OYKiLUS9G5t9u/8rcrUND2nAEF4gxwiDUe/8SBeF5Y="
								"data: charlie":                 "0Me5npo3E5mfeHjT6G4nx3qqtVkpnE25V9o0Pv7Kmp8="
								"schema: CUE":                   "WETWnWf42gFyKW0yYcSt1apUtMajQoMJm/s1Tc/hTSo="
								"data: bryn (fixed)":            "6QRFTtkHzCSVMtwR5exp3sIJKR+kriUr3ZUIXfJWXq0="
								"data: alex (reminder)":         "nzuODRpMJJEd21kxq3gjFMQltjX1rDSiKwiw0cI3Qqw="
								"data: bryn (reminder)":         "6h5oDstzHrxJYLqb6OAjSU3J5TJ1SeE+L56NL0hdV9g="
								"data: charlie (reminder)":      "ChlfbAuw2jrIoynkV8CzTSIa1YeocwUObOKo1QKzEgI="
								"schema: CUE (reminder)":        "q1KYxvn5SFkYjHUEowPA8vts87ZB45rTQAkzGa6Z5/I="
								"policy: CUE (too restrictive)": "smUAexCGNpfdlJJKjrzUwQU899zamTO8qi6U9Fv5GEw="
								"policy: CUE (correct)":         "0MklFJE4GuQE7k5X21XKyCNbxcH/3VPcWbrYooOC9jc="
								"schema.proto":                  "h24j3P5+WEoEuLM8cy6ja3NhuKKq1T6h9KBIMyYaqEU="
								"schema.json":                   "tJZsdsA/DI3x0DRJ7MMfjs0ylEzQd3w5iKFzvKCMdlI="
								"policy.cue":                    "GmRsCTgARFNXgN4IfyYmyac7TI5y50NmLSvLetqAnlw="
								"data.yml (broken)":             "ejRnvjMWfn1Y36CvIbh2UYfBGyrt4DGX6bHWMWXO/O8="
								"data.yml (fixed)":              "ox2pxGpLxCkvD0cNdjitjPyvGH5o/PaiOcX8YALQZHk="
							}
							code: {
								constraints: "KwUigk7bElIYH+Sf/9JdFmj5rWamq972NUk866OGzX8="
								definition:  "SSgJ8VF9npQTpUhJ6uL0Ka1+/Dmyjt6bFRwsYA6StB4="
							}
							multi_step: {
								hash:       "QMGRI4MNLAEANTM7IQJ91RE5D0UK80C8EKT8555SKVROHP17Q8DG===="
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
